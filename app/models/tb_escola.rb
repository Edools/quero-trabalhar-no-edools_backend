# frozen_string_literal: true

class TbEscola < ActiveRecord::Base
  # main config ...............................................................
  audited
  self.table_name = 'edools.tb_escolas'

  # extends ...................................................................
  has_attached_file :logo,
                    default_url: "#{Rails.root}/public/images/:style/missing.png"

  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  has_many :tb_cursos, class_name: 'TbCurso', foreign_key: :tb_escolas_id, dependent: :delete_all

  accepts_nested_attributes_for :tb_cursos, allow_destroy: true

  # validations ...............................................................
  validates_presence_of :nome, :email_dono, :subdominio
  validates_length_of :nome, :email_dono, :subdominio,
                      maximum: 255
  validates :email_dono, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates_uniqueness_of :subdominio
  validates_uniqueness_of :email_dono

  validate :verifica_subdominio,
            on: %i(create update)

  validates_attachment :logo,
                       size: { in: 0..10.megabyte }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/

  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  # class methods .............................................................
  # public instance methods ...................................................
  def monta_tb_cursos
    return tb_cursos if tb_cursos.present?
    tb_cursos.build
  end

  # protected instance methods ................................................
  # private instance methods ..................................................

  private

  def verifica_subdominio
    return if self.subdominio.to_s.include?('.edools.com')
    self.subdominio = self.subdominio.to_s.to_url.to_s.gsub('.edools.com', '')
  end
end
