
DefaultBehavior FlowControl tap = dmacro("takes one or two arguments that represent code. Will yield the receiver and then return the receiver after executing the given code",
  [code]
  code evaluateOn(call ground, self)
  self,

  [argName, code]
  LexicalBlock createFrom(list(argName, code), call ground) call(self)
  self
)

DefaultBehavior FlowControl rap = macro("takes one or more message chains. Will call these on the receiver, then return the receiver",
  call arguments each(code,
    code evaluateOn(call ground, self))
  self
)

DefaultBehavior FlowControl tapping = DefaultBehavior FlowControl cell(:rap)

DefaultBehavior FlowControl sap = dmacro(
  [sapCode, iterCode]
  result = sapCode evaluateOn(call ground, self)
  while(result,
    iterCode evaluateOn(call ground, result)
    result = sapCode evaluateOn(call ground, self))
  self,

  [sapCode, argName, iterCode]
  destructor = Mixins Enumerable Destructor from(argName)
  block = LexicalBlock createFrom(destructor argNames + list(iterCode), call ground)
  result = sapCode evaluateOn(call ground, self)
  while(result,
    block call(*(destructor unpack(result)))
    result = sapCode evaluateOn(call ground, self))
  self
)

