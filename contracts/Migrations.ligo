type migrations is record [
  owner : address;
  last_completed_migration : int;
]

function main (const completed_migration: int ; var migrations : migrations) : (list(operation) * migrations) is
  block {
    if Tezos.sender =/= migrations.owner
    then
      skip
    else
      migrations.last_completed_migration := completed_migration;
  } with ((nil : list(operation)), migrations);
