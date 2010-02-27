# Czech translations for Ruby on Rails 
# by Karel Minařík (karmi@karmi.cz)

{ :'cs' => {
    #:routes => {
    #  :categories => 'kategorie'
    #},

    # ActiveSupport
    :support => {
      :array => {
        :two_words_connector => ' a ',
        :sentence_connector => 'a',
        :skip_last_comma => true
      }
    },

    # Date
    :date => {
      :formats => {
        :default => "%d. %m. %Y",
        :short   => "%d %b",
        :long    => "%d. %B %Y",
      },
      :day_names         => %w{Neděle Pondělí Úterý Středa Čtvrtek Pátek Sobota},
      :abbr_day_names    => %w{Ne Po Út St Čt Pá So},
      :month_names       => %w{~ Leden Únor Březen Duben Květen Červen Červenec Srpen Září Říjen Listopad Prosinec},
      :abbr_month_names  => %w{~ Led Úno Bře Dub Kvě Čvn Čvc Srp Zář Říj Lis Pro},
      :order             => [:day, :month, :year]
    },

    # Time
    :time => {
      :formats => {
        :default => "%a %d. %B %Y %H:%M %z",
        :short   => "%d. %m. %H:%M",
        :long    => "%A %d. %B %Y %H:%M",
      },
      :am => 'am',
      :pm => 'pm'
    },

    # Numbers
    :number => {
      :format => {
        :precision => 3,
        :separator => '.',
        :delimiter => ','
      },
      :currency => {
        :format => {
          :unit => 'Kč',
          :precision => 2,
          :format    => '%n %u',
          :separator => ",",
          :delimiter => " ",
        }
      },
      :human => {
        :format => {
          :precision => 1,
          :delimiter => ''
        },
       :storage_units => {
         :format => "%n %u",
         :units => {
           :byte => "B",
           :kb   => "KB",
           :mb   => "MB",
           :gb   => "GB",
           :tb   => "TB",
         }
       }
      },
      :percentage => {
        :format => {
          :delimiter => ''
        }
      },
      :precision => {
        :format => {
          :delimiter => ''
        }
      }
    },

    # Distance of time ... helper
    # NOTE: In Czech language, these values are different for the past and for the future. Preference has been given to past here.
    :datetime => {
      :distance_in_words => {
        :half_a_minute => 'půl minutou',
        :less_than_x_seconds => {
          :one => 'asi před sekundou',
          :other => 'asi před {{count}} sekundami'
        },
        :x_seconds => {
          :one => 'sekundou',
          :other => '{{count}} sekundami'
        },
        :less_than_x_minutes => {
          :one => 'před necelou minutou',
          :other => 'před ani ne {{count}} minutami'
        },
        :x_minutes => {
          :one => 'minutou',
          :other => '{{count}} minutami'
        },
        :about_x_hours => {
          :one => 'asi hodinou',
          :other => 'asi {{count}} hodinami'
        },
        :x_days => {
          :one => '24 hodinami',
          :other => '{{count}} dny'
        },
        :about_x_months => {
          :one => 'asi měsícem',
          :other => 'asi {{count}} měsíci'
        },
        :x_months => {
          :one => 'měsícem',
          :other => '{{count}} měsíci'
        },
        :about_x_years => {
          :one => 'asi rokem',
          :other => 'asi {{count}} roky'
        },
        :over_x_years => {
          :one => 'více než před rokem',
          :other => 'více než {{count}} roky'
        }
      }
    },

    # ActiveRecord validation messages
    :activerecord => {
      :attributes => {
        :product => {
          :title => 'Název',
          :description => 'Popis',
          :category_id => 'Kategorie',
          :price => 'Cena',
          :count => 'Počet'
        }
      },
      :errors => {
        :messages => {
          :inclusion           => "není v seznamu povolených hodnot",
          :exclusion           => "je vyhrazeno pro jiný účel",
          :invalid             => "není platná hodnota",
          :confirmation        => "nebylo potvrzeno",
          :accepted            => "musí být potvrzeno",
          :empty               => "nesmí být prázdný/é",
          :blank               => "je povinná položka", # alternate formulation: "is required"
          :too_long            => "je příliš dlouhá/ý (max. {{count}} znaků)",
          :too_short           => "je příliš krátký/á (min. {{count}} znaků)",
          :wrong_length        => "nemá správnou délku (očekáváno {{count}} znaků)",
          :taken               => "již databáze obsahuje",
          :not_a_number        => "není číslo",
          :greater_than        => "musí být větší než {{count}}",
          :greater_than_or_equal_to => "musí být větší nebo rovno {{count}}",
          :equal_to            => "musí být rovno {{count}}",
          :less_than           => "musí být méně než {{count}}",
          :less_than_or_equal_to    => "musí být méně nebo rovno {{count}}",
          :odd                 => "musí být liché číslo",
          :even                => "musí být sudé číslo",
          :record_invalid                => "Neplatný záznam."
        },
        :template => {
          :header   => {
            #:one => "Při ukládání objektu {{model}} došlo k chybám a nebylo jej možné uložit",
            :one => "Akci nebylo možné provést",
            #:other => "Při ukládání objektu {{model}} došlo ke {{count}} chybám a nebylo možné jej uložit"
            :other => "Akci nebylo možné provést"
          },
          :body  => "Následující pole obsahují chybně vyplněné údaje:"
        }
      }
    },
    :models => {
      :product => "Zboží",
      :category => "Kategorie",
    },
    :attributes => {
      :product => {
        :price => "cena",
        :count => "počet"
      }
    }
  },
  :authlogic => {
    :error_messages => {
      :login_blank => "can not be blank",
      :login_not_found => "is not valid",
      :login_invalid => "should use only letters, numbers, spaces, and .-_@ please.",
      :consecutive_failed_logins_limit_exceeded => "Consecutive failed logins limit exceeded, account is disabled.",
      :email_invalid => "should look like an email address.",
      :password_blank => "can not be blank",
      :password_invalid => "is not valid",
      :not_active => "Your account is not active",
      :not_confirmed => "Your account is not confirmed",
      :not_approved => "Your account is not approved",
      :no_authentication_details => "You did not provide any details for authentication."
    },
    :models => {
      :user_session => "UserSession (or whatever name you are using)"
    }, 
    :attributes => {
      :keeper_session => {
        :login => "login",
        :email => "email",
        :password => "password",
        :remember_me => "remember me"
      }       
    }
  }
}

