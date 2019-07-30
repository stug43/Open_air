# frozen_string_literal: true

FactoryBot.define do
  factory :dataset do
    title { 'Activité maritime Marseille/Fos' }
    # First topic is the Maritime Port, for which specific datasets are linked
    db_link { 'https://trouver.datasud.fr/dataset/les-lignes-maritimes-regulieres-touchant-le-port-de-marseille-fos' }
    dpsir_category { 'Driver' }
    description do
      "55 services maritimes réguliers relient le Port de Marseille-Fos à plus de 500 autres ports et desservent près de 160 pays dans le monde.
      40 compagnies maritimes sont représentées, dont les 11 premières mondiales en capacité de conteneurs.
      Des lignes maritimes pour tous types de trafic - conteneur, roulant, conventionnel, car-ferry - avec des capacités de transport et des fréquences adaptées à l'évolution des échanges internationaux.
      Des transit-times performants : Algérie à 1,5 jour, Grèce à 3 jours, Afrique de l’Ouest à 9 jours, Océan Indien à 15 jours, Asie à 18 jours, Australie à 26 jours, Etats-Unis à 11 jours, Antilles à 13 jours, Brésil à 17 jours."
    end
    rendered { false }
    file_type { 'pdf' }
  end
end
