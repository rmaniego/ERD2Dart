# MIT License
# 
# Copyright (c) 2024 Rodney M. Maniego Jr.
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import re
from pathlib import Path
from argparse import ArgumentParser


RE_USCORE = re.compile(r"_+")
STRINGS = {"char", "text", "clob", "string"}
DOUBLES = {"float", "double", "real", "decimal", "numeric", "money"}
INTEGERS = {"int", "bit", "serial", "integer"}

def convert_to_snake_case(text):
    for order in range(65, 91):
        letter = chr(order)
        if letter not in text:
            continue
        text = text.replace(letter, f"_{letter}".lower())

    if text[0] == "_":
        text = text[1:].replace("__", "_")
    
    return RE_USCORE.sub("_", text)

def attribute_parser(attribute, pk=False):
    
    # p/fk, attribute, data type, required, final, default
    # +/# attribute : data type, not null, *,   = ''
    parsed = ["", attribute, "String", "null", "", ""]
    
    if attribute[0] == "+":
        attribute = attribute[1:]
        pk = True
    
    if pk:
        parsed[0] = "+"
        parsed[2] = "int"
        parsed[3] = "not null"
        parsed[4] = "*"
        if "uuid" in attribute:
            parsed[2] = "String"
    
    if attribute[0] == "#":
        parsed[0] += "#"
        parsed[2] = "int"
        parsed[3] = "not null"
        parsed[4] = "*"
        attribute = attribute[1:].strip()
        if "uuid" in attribute:
            parsed[2] = "String"
    
    if ":" not in attribute:
        parsed[1] = attribute.strip()
        return parsed

    assert attribute.count(":") == 1
    name, metadata = attribute.split(":")
    parsed[1] = name.strip()
    
    default = None
    if "=" in metadata:
        # Do not hard code !!
        assert metadata.count("=") == 1
        metadata, default = metadata.split("=")
        parsed[5] = default.strip()
        metadata = metadata.strip()
        
    
    parsed[3] = "null"
    if "not null" in metadata:
        parsed[3] = "not null"
    
    metadata = metadata.replace("not null", "")
    metadata = metadata.replace("null", "")
    
    parsed[4] = ""
    if "*" in metadata:
        parsed[4] = "*"
        metadata = metadata.replace("*", "").strip().lower()
    
    if any(kw in metadata for kw in DOUBLES):
        parsed[2] = "double"
        return parsed
    
    if any(kw in metadata for kw in INTEGERS):
        parsed[2] = "int"
        return parsed
    
    if not metadata.strip() or any(kw in metadata for kw in STRINGS):
        parsed[2] = "String"
        return parsed
    
    raise Exception("Unsupported `ERD2Dart` data type.")

def attributes_to_dart(entity, attributes, destination):
    dart_data = "import 'dart:convert';\n\n"
    dart_data += "class "+entity+" {\n\t"
    dart_data += "\n\t".join(attributes["class"])
    dart_data += "\n\n\t"
    dart_data += entity+"({\n\t\t"
    dart_data += "\n\t\t".join(attributes["constructor"])
    dart_data += "\n\t});\n"
    dart_data += "\n\tMap<String, dynamic> toMap() {"
    dart_data += "\n\t\treturn {\n\t\t\t"
    dart_data += "\n\t\t\t".join(attributes["map"])
    dart_data += "\n\t\t};"
    dart_data += "\n\t}"
    dart_data += "\n\n\tfactory "+entity+".fromMap(Map<String, dynamic> map) {"
    dart_data += "\n\t\treturn "+entity+"(\n\t\t\t"
    dart_data += "\n\t\t\t".join(attributes["factory"])
    dart_data += "\n\t\t);"
    dart_data += "\n\t}"
    dart_data += "\n\n\tString toJson() => json.encode(toMap());"
    dart_data += f"\n\n\tfactory {entity}.fromJson(String source) => {entity}.fromMap(json.decode(source));\n\t"
    dart_data += "\n\t@override"
    dart_data += "\n\tString toString() {"
    dart_data += "\n\t\treturn '{" + ", ".join(attributes["string"]) + "}';"
    dart_data += "\n\t}"
    dart_data += "\n}"
    
    columns = ", ".join(attributes["columns"])
    name = convert_to_snake_case(entity).strip()
    print(f"\n\t\tawait db.execute(\n\t\t\t\"CREATE TABLE {name} ({columns});\",\n\t\t);")
    
    with open(f"{destination}/{name}.dart", mode="w+", encoding="utf-8") as file:
        file.write(dart_data)

def generate_utils(className):
    objectName = className.strip()
    objectName = objectName[0].lower() + objectName[1:]
    attribute = convert_to_snake_case(className).strip()
    
    dart_data = "\n\tFuture<void> insert"+className+"("+className+" "+objectName+") async {\r\n"
    dart_data += "\t\tfinal db = await _databaseService.database;\r\n"
    dart_data += "\t\tawait db.insert(\r\n"
    dart_data += "\t\t\t'"+attribute+"',\r\n"
    dart_data += "\t\t\t"+objectName+".toMap(),\r\n"
    dart_data += "\t\t\tconflictAlgorithm: ConflictAlgorithm.replace,\r\n"
    dart_data += "\t\t);\r\n"
    dart_data += "\t}\r\n"
    dart_data += "\r\n"
    dart_data += "\tFuture<void> update"+className+"("+className+" "+objectName+") async {\r\n"
    dart_data += "\t\tfinal db = await _databaseService.database;\r\n"
    dart_data += "\t\tawait db.update('"+attribute+"', "+objectName+".toMap(), where: 'uuid = ?', whereArgs: ["+objectName+".uuid]);\r\n"
    dart_data += "\t}\r\n"
    dart_data += "\r\n"
    dart_data += "\tFuture<List<"+className+">> get"+className+"(uuid) async {\r\n"
    dart_data += "\t\tfinal db = await _databaseService.database;\r\n"
    dart_data += "\t\tfinal List<Map<String, dynamic>> maps = await db.query('"+attribute+"', where: 'uuid = ?', whereArgs: [uuid]);\r\n"
    dart_data += "\t\treturn List.generate(maps.length, (index) => "+className+".fromMap(maps[index]));\r\n"
    dart_data += "\t}\r\n"
    dart_data += "\r\n"
    dart_data += "\tFuture<List<"+className+">> get"+className+"s(int limit) async {\r\n"
    dart_data += "\t\tfinal db = await _databaseService.database;\r\n"
    dart_data += "\t\tfinal List<Map<String, dynamic>> maps = await db.query('"+attribute+"', limit: limit, where: 'is_deleted=0');\r\n"
    dart_data += "\t\treturn List.generate(maps.length, (index) => "+className+".fromMap(maps[index]));\r\n"
    dart_data += "\t}"
    
    dart_data = dart_data.replace("ss(", "ses(")
    dart_data = dart_data.replace("ys(", "ies(")
    
    print(dart_data)

def text_to_dart(source, destination):
    with open(source) as file:
        dataset = file.read()
    
    print("\nOnCreate Methods")
    print("--------------")
    
    relations = []
    entities = re.split(r"\r*\n*---\r*\n*", dataset)
    for entity in entities:
        
        attribs = {}
        attribs["class"] = []
        attribs["constructor"] = []
        attribs["map"] = []
        attribs["factory"] = []
        attribs["string"] = []
        attribs["columns"] = []

        attributes = re.split(r"\r*\n", entity)
        
        entity_name = attributes[0]
        # print(entity_name)
        assert " " not in entity_name
        relations.append(entity_name)

        for idx, attribute in enumerate(attributes[1:]):
    
            attribute = attribute.strip()
            if not attribute:
                continue

            parsed = attribute_parser(attribute, pk=idx==0)
            
            value = parsed[1]
            dtype = parsed[2]
            default = parsed[5]
            
            if not default:
                if dtype == "int":
                    default = "0"
                elif dtype == "double":
                    default = "0.0"
                elif dtype == "String":
                    default = "''"
            
            sk_value = convert_to_snake_case(value)
            attribs["map"].append(f"'{sk_value}': {value},")
            
            if dtype == "String":
                attribs["string"].append(f"\"{sk_value}\": \"${value}\"")
            else:
                attribs["string"].append(f"\"{sk_value}\": ${value}")
            
            to_int = ["", "?.toInt()"][int(dtype == "int")]
            attribs["factory"].append(f"{value}: map['{sk_value}']{to_int} ?? {default},")
            
            not_null = ["", "NOT NULL "][int(parsed[3] == "not null")]
            
            is_key = any(c in "+#" for c in parsed[0])
            if is_key:
                if dtype == "int":
                    attribs["class"].append(f"final int? {value};")
                    attribs["columns"].append(f"{sk_value} INTEGER PRIMARY KEY AUTOINCREMENT")
                else:
                    attribs["class"].append(f"final String {value};")
                    attribs["columns"].append(f"{sk_value} TEXT PRIMARY KEY")
                
                attribs["constructor"].append(f"required this.{value},")
                continue
            
            default = parsed[5]
            if parsed[5]:
                default = f"DEFAULT {default}"
            
            if dtype == "int":
                attribs["columns"].append(f"{sk_value} INTEGER {not_null}{default}".strip())
            elif dtype == "double":
                attribs["columns"].append(f"{sk_value} REAL {not_null}{default}".strip())
            elif dtype == "String":
                attribs["columns"].append(f"{sk_value} TEXT {not_null}{default}".strip())
            
            final = ["", "final"][int(parsed[4] == "*")]
            required1 = ["?", ""][int(parsed[3] == "not null")]    
            attribs["class"].append(f"{final} {dtype}{required1} {value};".strip())
                
            required2 = ["", "required"][int(parsed[3] == "not null")] 
            attribs["constructor"].append(f"{required2} this.{value},".strip())
            
        attributes_to_dart(entity_name, attribs, destination)

    
    print("\nHelper Methods")
    print("--------------")
    
    for relation in relations:
        generate_utils(relation);

def main():
    
    parser = ArgumentParser()
    parser.add_argument(
        "-s",
        "--source",
        dest="source",
        type=str,
        required=True,
        help="Text, CSV, or JSON file containing the text-based ERD.",
    )
    parser.add_argument(
        "-d",
        "--destination",
        dest="destination",
        type=str,
        required=True,
        help="Destination directory of output files.",
    )
    parser.add_argument(
        "-f",
        "--force",
        dest="force",
        type=int,
        default=0,
        help="Create directory if it does not exists.",
    )
    
    args = parser.parse_args()
    
    source = args.source
    extension = source.split(".")[-1]
    assert extension in ("txt", "csv", "json")
    
    force = args.force
    assert force in (0,1)
    
    destination = args.destination
    directory = Path(destination)
    
    if not directory.exists():
        if force:
            directory.mkdir(parents=True, exist_ok=True)
        else:
            raise Exception(f"`{destination}` path does not exists.")

    text_to_dart(source, destination)

if __name__ == "__main__":
    main()