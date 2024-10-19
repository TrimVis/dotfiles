# Defined in - @ line 1
function cardano-cli-h --wraps='cardano-cli'
  cardano-cli $argv --socket-path ~/hydra/node.socket --testnet-magic 1;
end
