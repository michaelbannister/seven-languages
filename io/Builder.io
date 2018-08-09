OperatorTable addAssignOperator(":", "atPutValue")

curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doString(arg asString)
  )
  r
)

Map atPutValue := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""),
    call evalArgAt(1)
  )
)

Map attrString := method(
  " " .. (self map(key, value, "#{key}=\"#{value}\"" interpolate) sort join(" "))
)


Builder := Object clone
Builder spaces := 0
Builder indentSize := 3
Builder increaseIndent := method(spaces = spaces + indentSize)
Builder decreaseIndent := method(spaces = spaces - indentSize)
Builder indent := method(" " repeated(spaces))

Builder forward := method(
  tag := call message name
  firstArg := call evalArgAt(0)
  attrString := if(firstArg type == "Map", firstArg attrString, "")
  remainingArgs := if(firstArg type == "Map", call message arguments rest, call message arguments)
  selfClosing := remainingArgs size == 0
  write(indent, "<", tag, attrString)
  if(selfClosing,
    writeln("/>"),
  // else
    writeln(">")
    increaseIndent
  )
  remainingArgs foreach(arg, 
	  content := self doMessage(arg); 
	  if(content type == "Sequence", writeln(indent, content))
  )
  if(selfClosing == false,
    decreaseIndent
    writeln(indent, "</", tag, ">")
  )
)
