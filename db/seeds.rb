roles = [
    'admin',
    'atendimento',
    'eps',
    'backoffice',
    'n2'
]

roles.each do |name|
  Admin::Role.create(name: name)
end

users = [
    ['admin', 'admin@rede.com.br', '4dm1n1str4d0r', 1],
    ['atendimento', 'atendimento@rede.com.br', '4t3nd1m3nto', 2],
    ['eps', 'eps@rede.com.br', 'pr3st4d0r', 3],
    ['backoffice', 'backoffice@rede.com.br', 'b4ck0ff1c3', 4],
    ['n2', 'n2@rede.com.br', 'n1v3l2', 5]
]

users.each do |name, email, password, role|
  Admin::User.create(name: name, email:email, password:password, role_id: role)
end

