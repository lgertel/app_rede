roles = [
    'atendimento',
    'eps',
    'backoffice',
    'n2'
]

roles.each do |name|
  Admin::Role.create(name: name)
end

users = [
    ['atendimento', 'atendimento@rede.com.br', '4t3ndim3nto', 1],
    ['eps', 'eps@rede.com.br', '3ps', 2],
    ['backoffice', 'backoffice@rede.com.br', 'b4ck0ffic3', 3],
    ['n2', 'n2@rede.com.br', 'n2', 4]
]

users.each do |name, email, password, role|
  Admin::User.create(name: name, email:email, password:password, role_id: role)
end

