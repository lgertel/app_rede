users = [
    ['admin', 'admin@rede.com.br', '4dm1n1str4d0r', 'admin'],
    ['atendimento', 'atendimento@rede.com.br', '4t3nd1m3nto', 'atendimento'],
    ['eps', 'eps@rede.com.br', 'pr3st4d0r', 'eps'],
    ['backoffice', 'backoffice@rede.com.br', 'b4ck0ff1c3', 'backoffice'],
    ['n2', 'n2@rede.com.br', 'n1v3l2', 'n2'],
    ['middleoffice', 'middleoffice@rede.com.br', 'm1ddl3off1c3', 'middleoffice'],
    ['cliente', 'cliente@rede.com.br', 'cl13nt3', 'cliente'],
    ['log_interna', 'log_interna@rede.com.br', 'log1nt3rn4', 'log_interna'],
    ['log_externa', 'log_externa@rede.com.br', 'log3xt3rn4', 'log_externa']
]

users.each do |name, email, password, role|
  user = Admin::User.create(name: name, email:email, password:password)
  user.add_role role
end

