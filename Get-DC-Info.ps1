#Get all the FSMO(flexible Single Master Operation) roles used for redundancy,services,clustering and resilience
Import-Module -Name ActiveDirectory

Get-ADDomain | Select-Object InfrastructureMaster, RIDMaster, PDCEmulator

Get-ADForest | Select-Object DomainNamingMaster, SchemaMaster

Get-ADDomainController -Filter * |

     Select-Object Name, Domain, Forest, OperationMasterRoles |

     Where-Object {$_.OperationMasterRoles} |

     Format-Table -AutoSize
