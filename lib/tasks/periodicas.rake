namespace :periodicas do
  desc "Tarefa Para Desativar Descontos"
  task desativa_descontos: :environment do
    descontos = Desconto.where('inativacao < ? and status = true', Date.today)
    descontos.each do |desconto|
      desconto.update!(status: false)
    end
  end
end
