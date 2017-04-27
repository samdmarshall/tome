# =======
# Imports
# =======

import os
import json
import sets
import db_sqlite
import parseopt2
import httpclient

import cmd
import parsetoml

import "usage.nim"
import "version.nim"

import "command/add.nim"
import "command/remove.nim"
import "command/search.nim"

# ====================
# Forward Declarations
# ====================

proc versionInfo*(ctx: var CmdPrompt, input: seq[string]): void = 
  versionInfo()

proc addBookmark*(ctx: var CmdPrompt, input: seq[string]): void =
  echo "addBookmark(input)"
  
proc removeBookmark*(ctx: var CmdPrompt, input: seq[string]): void =
  echo "removeBookmark(input)"

proc searchBookmark*(ctx: var CmdPrompt, input: seq[string]): void = 
  echo "searchBookmark(input)"

# =====
# Types
# =====

type SubCommand {.pure.} = enum 
  Interactive = "interactive",
  Add = "add",
  Remove = "remove",
  Search = "search",
  Help = "help",
  Version = "version",
  
# =========
# Constants
# =========

let CmdAdd = Command(name: $(SubCommand.Add), help: "Adds a new bookmark to be stored", exeCmd: addBookmark)
let CmdRemove = Command(name: $(SubCommand.Remove), help: "Removes a bookmark from storage", exeCmd: removeBookmark)
let CmdSearch = Command(name: $(SubCommand.Search), help: "Searches for a bookmark given a string", exeCmd: searchBookmark)
let CmdVersion = Command(name: $(SubCommand.Version), help: "Displays the version information", exeCmd: versionInfo)
let PromptCommands = [CmdAdd, CmdRemove, CmdSearch, CmdVersion].toSet

# ===========
# Entry Point
# ===========

var args = initOptParser()
args.next()
case args.kind
of cmdArgument:
  case args.key
  of $(SubCommand.Interactive):
    var prompt = CmdPrompt(commands: PromptCommands, promptString: "> ")
    prompt.run()
  of $(SubCommand.Add):
    discard
  of $(SubCommand.Remove):
    discard
  of $(SubCommand.Search):
    discard
  of $(SubCommand.Help):
    usage()
  of $(SubCommand.Version):
    versionInfo()
  else:
    discard
else:
  case args.key
  of "h", "help":
    usage()
  of "v", "version":
    versionInfo()
  else:
    discard

