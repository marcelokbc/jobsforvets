module PositionsHelper
  def text_position(position)
    "A empresa #{position.company.name} em #{position.city} está com a vaga de #{position.name}.Veja mais detalhes no nosso mural! #{url_position(position)}"
  end

  def url_position(position)
    public_position_url(position.slug)
  end

  def formatted_career_and_contract(position)
    career_translation = I18n.t('activerecord.attributes.position.careers')[position.career.to_sym]
    contract_translation = I18n.t('activerecord.attributes.position.contracts')[position.contract.to_sym]

    "#{career_translation} - #{position.city} - #{contract_translation}"
  end
end
