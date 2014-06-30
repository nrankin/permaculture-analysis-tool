# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
elements = Element.create([{name: 'ObserveAndInteract', element_type:'Principle'},
                          {name: 'CatchAndStoreEnergy', element_type:'Principle'},
                          {name: 'ObtainAYield', element_type: 'Principle'},
                          {name: 'ApplySelfRegulationAndAcceptFeedback', element_type: 'Principle'},
                          {name: 'UseAndValueRenewableResourcesAndServices', element_type: 'Principle'},
                          {name: 'ProduceNoWaste', element_type:'Principle' },
                          {name: 'DesignFromPatternsToDetails', element_type:'Principle'},
                          {name: 'IntegrateRatherThanSegregate', element_type:'Principle'},
                          {name: 'UseSmallAndSlowSolutions', element_type:'Principle'},
                          {name: 'UseAndValueDiverstiy', element_type: 'Principle'},
                          {name: 'UseEdgesAndValueTheMarginal', element_type: 'Principle'},
                          {name: 'CreativelyUseAndRespondToChange', element_type: 'Principle'}])
