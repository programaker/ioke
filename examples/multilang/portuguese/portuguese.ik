PortugueseDefaultBehavior = Reflector other:mimic(DefaultBehavior)

PortugueseDefaultBehavior Origem = Origin

PortugueseDefaultBehavior célula = cell(:cell)
PortugueseDefaultBehavior imite = cell(:mimic)
PortugueseDefaultBehavior imite! = cell(:mimic!)
PortugueseDefaultBehavior método = cell(:method)
PortugueseDefaultBehavior função = cell(:fn)
PortugueseDefaultBehavior faça = cell(:do)
PortugueseDefaultBehavior com = cell(:with)
PortugueseDefaultBehavior eu = method(self)

PortugueseDefaultBehavior se = cell(:if)
PortugueseDefaultBehavior verdadeiro = cell(:true)
PortugueseDefaultBehavior falso = cell(:false)

PortugueseDefaultBehavior imprima = Origin cell(:print)
PortugueseDefaultBehavior imprimaLinha = Origin cell(:println)

DefaultBehavior mimic!(PortugueseDefaultBehavior)
