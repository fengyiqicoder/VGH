//
//  Constants.swift
//  VGH
//
//  Created by 冯奕琦 on 2018/11/1.
//  Copyright © 2018年 冯奕琦. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    //MARK:V2ex
    static let nodeDataUrl = "https://www.v2ex.com/api/topics/show.json?node_name="
    static let detailDataUrl = "https://www.v2ex.com/api/replies/show.json?topic_id="
    static let NodeNamesArray:[(name:String,apiName:String?,width:CGFloat)] = [("程序员","programmer",70),("奇思妙想","ideas",90),("问与答","qna",70),("分享创造","create",90),("apple",nil,50),("电影","Movie",50),("iPhone",nil,70),("电子游戏","games",90),("iPad",nil,50),("音乐","music",50),("macOS",nil,70),("iOS 开发","idev",110),("Android",nil,80),("旅游","travel",50),("重口味问与答","offworld",135),("Python","python",90),("Linux","linux",70),("阅读","reading",50),("设计","design",50),("旅行","travel",50),("mbp","mbp",40)]
    //MARK:Github Trending
    static let trendingURL = "https://github.com/trending/"
    static let allLangages = [ "All Languages" ]
    static let languageDictionary:[String:[String]] = ["1":["1C-Enterprise"],
                                                       "A":["ABAP","ABNF","ActionScript","Ada","AdobeFontMetrics","Agda","AGS-Script","Alloy","Alpine-Abuild","AMPL","AngelScript","Ant-Build-System","ANTLR","ApacheConf","Apex","API-Blueprint","APL","Apollo-Guidance-Computer","AppleScript","Arc","AsciiDoc","ASN.1","ASP","AspectJ","Assembly","ATS","Augeas","AutoHotkey","AutoIt","Awk"],
                                                       "B":["Ballerina","Batchfile","Befunge","Bison","BitBake","Blade","BlitzBasic","BlitzMax","Bluespec","Boo","Brainfuck","Brightscript","Bro"],
                                                       "C":["C","C#","C++","C-ObjDump","C2hs-Haskell","Cap'n-Proto","CartoCSS","Ceylon","Chapel","Charity","ChucK","Cirru","Clarion","Clean","Click","CLIPS","Clojure","Closure-Templates","Cloud-Firestore-Security-Rules","CMake","COBOL","CoffeeScript","ColdFusion","ColdFusion-CFC","COLLADA","Common-Lisp","Common-Workflow-Language","Component-Pascal","CoNLL-U","Cool","Coq","Cpp-ObjDump","Creole","Crystal","CSON","Csound","Csound-Document","Csound-Score","CSS","CSV","Cuda","CWeb","Cycript","Cython"],
                                                       "D":["D","D-ObjDump","Darcs-Patch","Dart","DataWeave","desktop","Diff","DIGITAL-Command-Language","DM","DNS-Zone","Dockerfile","Dogescript","DTrace","Dylan"],
                                                       "E":["E","Eagle","Easybuild","EBNF","eC","Ecere-Projects","ECL","ECLiPSe","Edje-Data-Collection","edn","Eiffel","EJS","Elixir","Elm","Emacs-Lisp","EmberScript","EQ","Erlang"],
                                                       "F":["F#","F*","Factor","Fancy","Fantom","Filebench-WML","Filterscript","fish","FLUX","Formatted","Forth","Fortran","FreeMarker","Frege"],
                                                       "G":["G-code","Game-Maker-Language","GAMS","GAP","GCC-Machine-Description","GDB","GDScript","Genie","Genshi","Gentoo-Ebuild","Gentoo-Eclass","Gerber-Image","Gettext-Catalog","Gherkin","GLSL","Glyph","GN","Gnuplot","Go","Golo","Gosu","Grace","Gradle","Grammatical-Framework","Graph-Modeling-Language","GraphQL","Graphviz (DOT)","Groovy","Groovy-Server-Pages"],
                                                       "H":["Hack","Haml","Handlebars","Harbour","Haskell","Haxe","HCL","HiveQL","HLSL","HTML","HTML+Django","HTML+ECR","HTML+EEX","HTML+ERB","HTML+PHP","HTTP","HXML","Hy","HyPhy"],
                                                       "I":["IDL","Idris","IGOR-Pro","Inform-7","INI","Inno-Setup","Io","Ioke","IRC-log","Isabelle","Isabelle-ROOT"],
                                                       "J":["J","Jasmin","Java","Java-Server-Pages","JavaScript","JFlex","Jison","Jison-Lex","Jolie","JSON","JSON-with-Comments","JSON5","JSONiq","JSONLD","JSX","Julia","Jupyter-Notebook"],
                                                       "K":["KiCad-Layout","KiCad-Legacy-Layout","KiCad-Schematic","Kit","Kotlin","KRL"],
                                                       "L":["LabVIEW","Lasso","Latte","Lean","Less","Lex","LFE","LilyPond","Limbo","Linker-Script","Linux-Kernel-Module","Liquid","Literate-Agda","Literate-CoffeeScript","Literate-Haskell","LiveScript","LLVM","Logos","Logtalk","LOLCODE","LookML","LoomScript","LSL","Lua"],
                                                       "M":["M","M4","M4Sugar","Makefile","Mako","Markdown","Marko","Mask","Mathematica","Matlab","Maven-POM","Max","MAXScript","MediaWiki","Mercury","Meson","Metal","MiniD","Mirah","Modelica","Modula-2","Modula-3","Module-Management-System","Monkey","Moocode","MoonScript","MQL4","MQL5","MTML","MUF","mupad","Myghty"],
                                                       "N":["NCL","Nearley","Nemerle","nesC","NetLinx","NetLinx+ERB","NetLogo","NewLisp","Nextflow","Nginx","Nim","Ninja","Nit","Nix","NL","NSIS","Nu","NumPy"],
                                                       "O":["ObjDump","Objective-C","Objective-C++","Objective-J","OCaml","Omgrofl","ooc","Opa","Opal","OpenCL","OpenEdge-ABL","OpenRC-runscript","OpenSCAD","OpenType-Feature-File","Org","Ox","Oxygene","Oz"],
                                                       "P":["P4","Pan","Papyrus","Parrot","Parrot-Assembly","Parrot-Internal-Representation","Pascal","PAWN","Pep8","Perl","Perl-6","PHP","Pic","Pickle","PicoLisp","PigLatin","Pike","PLpgSQL","PLSQL","Pod","PogoScript","Pony","PostCSS","PostScript","POV-Ray-SDL","PowerBuilder","PowerShell","Processing","Prolog","Propeller-Spin","Protocol-Buffer","Public-Key","Pug","Puppet","Pure-Data","PureBasic","PureScript","Python","Python-console","Python-traceback"],
                                                       "Q":["q","QMake","QML","Quake"],
                                                       "R":["R","Racket","Ragel","RAML","Rascal","Raw-token-data","RDoc","REALbasic","Reason","Rebol","Red","Redcode","Regular-Expression","Ren'Py","RenderScript","reStructuredText","REXX","RHTML","Ring","RMarkdown","RobotFramework","Roff","Rouge","RPC","RPM-Spec","Ruby","RUNOFF","Rust"],
                                                       "S":["Sage","SaltStack","SAS","Sass","Scala","Scaml","Scheme","Scilab","SCSS","sed","Self","ShaderLab","Shell","ShellSession","Shen","Slash","Slice","Slim","Smali","Smalltalk","Smarty","SMT","Solidity","SourcePawn","SPARQL","Spline-Font-Database","SQF","SQL","SQLPL","Squirrel","SRecode-Template","Stan","Standard-ML","Stata","STON","Stylus","SubRip-Text","SugarSS","SuperCollider","SVG","Swift","SystemVerilog"],
                                                       "T":["Tcl","Tcsh","Tea","Terra","TeX","Text","Textile","Thrift","TI-Program","TLA","TOML","Turing","Turtle","Twig","TXL","Type-Language","TypeScript"],
                                                       "U":["Unified-Parallel-C","Unity3D-Asset","Unix-Assembly","Uno","UnrealScript","UrWeb"],
                                                       "V":["Vala","VCL","Verilog","VHDL","Vim-script","Visual-Basic","Volt","Vue"],
                                                       "W":["Wavefront-Material","Wavefront-Object","wdl","Web-Ontology-Language","WebAssembly","WebIDL","wisp","World-of-Warcraft-Addon-Data"],
                                                       "X":["X-BitMap","X-Font-Directory-Index","X-PixMap","X10","xBase","XC","XCompose","XML","Xojo","XPages","XProc","XQuery","XS","XSLT","Xtend"],
                                                       "Y":["Yacc","YAML","YANG","YARA","YASnippet"],
                                                       "Z":["Zephir","Zimpl"]]
    static let addNewLanguageButtonTitle = "添加新的语言"
}
