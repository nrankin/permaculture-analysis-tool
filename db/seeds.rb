# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
principles = Principle.create([{name: 'ObserveAndInteract', principle_type:'Design'},
                          {name: 'CatchAndStoreEnergy', principle_type:'Design'},
                          {name: 'ObtainAYield', principle_type: 'Design'},
                          {name: 'ApplySelfRegulationAndAcceptFeedback', principle_type: 'Design'},
                          {name: 'UseAndValueRenewableResourcesAndServices', principle_type: 'Design'},
                          {name: 'ProduceNoWaste', principle_type:'Design' },
                          {name: 'DesignFromPatternsToDetails', principle_type:'Design'},
                          {name: 'IntegrateRatherThanSegregate', principle_type:'Design'},
                          {name: 'UseSmallAndSlowSolutions', principle_type:'Design'},
                          {name: 'UseAndValueDiverstiy', principle_type: 'Design'},
                          {name: 'UseEdgesAndValueTheMarginal', principle_type: 'Design'},
                          {name: 'CreativelyUseAndRespondToChange', principle_type: 'Design'}])
