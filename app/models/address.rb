class Address < ActiveRecord::Base
  belongs_to :order

  validates :first_name, presence: { message: 'Imię jest wymagane.' }
  validates :last_name, presence: { message: 'Nazwisko jest wymagane.' }
  validates :city, presence: { message: 'Miasto jest wymagane.' }
  validates :zip_code, presence: { message: 'Kod pocztowy jest wymagany.' }, format: { with: /\A[-\d\s]*\z/, message: 'Kod pocztowy powinien mieć format XX-XXX.' }
  validates :street, presence: { message: 'Ulica jest wymagana.' }
  validates :email, presence: { message: 'Email jest wymagany.' }, format: { with: URI::MailTo::EMAIL_REGEXP, message: 'Format adresu email jest nieprawidłowy.' }
  validates :phone, presence: { message: 'Numer telefonu jest wymagany.' }, format: { with: /\A[()+\d\s]*\z/, message: 'Numer telefonu może zawierać tylko cyfry, nawiasy lub znak "+".' }
end
