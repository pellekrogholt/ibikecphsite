var I18n = I18n || {};
I18n.translations = {"en":{"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"]},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match confirmation","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","too_long":"is too long (maximum is %{count} characters)","too_short":"is too short (minimum is %{count} characters)","wrong_length":"is the wrong length (should be %{count} characters)","not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","odd":"must be odd","even":"must be even"}},"activerecord":{"errors":{"messages":{"taken":"has already been taken","record_invalid":"Validation failed: %{errors}"}}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":""}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"},"button":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"}},"from":"from","to":"to","title":"I BIKE CPH | Bike Route Planner (alpha)","generate_link":"Make a Link","route_description":"Route Description","distance":"distance","duration":"time","arrival":"arrival","1":"first","2":"seccond","3":"third","4":"fourth","5":"fifth","6":"sixth","7":"seventh","8":"eigth","9":"ninth","10":"tenth","N":"noth","NE":"noth east","E":"east","SE":"south east","S":"south","SW":"south west","W":"west","NW":"north west","head":"Start","continue":"Continue","turn-left":"Turn left","turn-slight-left":"Turn slightly to the left","turn-sharp-left":"Turn sharply to the left","turn-right":"Turn right","turn-slight-right":"Turn slighty to the right","turn-sharp-right":"Turn sharply to the right","enter-roundabout":"Enter the roundabout","take-the-nth-exit":"Take the {%nth} exit","reached-destination":"You arrived at the destination","follow":"following","and_continue":"and continue for","for":"for"},"de":{"subtitle":"HINWEIS: Dies ist nur ein Prototyp, und sollte nicht zur Navigation verwendet werden.","getting_started":"Klicken Sie auf die Karte oder geben Sie die Adressen in die Felder unten aus.","headline":"OSRM-Rails Demo","start":"Start","end":"Ziel","show":"Show","reset":"Reset","search":"Zeigen","reverse":"Umdrehen","josm":"JOSM","osm_bugs":"OSM Bugs","map_tools":"Kartenwerkzeuge","highlight_unnamed":"Unbenannte Stra\u00dfen hervorheben","start_tip":"Startposition eingeben","end_tip":"Zielposition eingeben","legal":"Routing by <a href=\"https://github.com/DennisOSRM/Project-OSRM/wiki\">OSRM</a>","search_results":"Suchergebnisse","found_x_results":"%{i} Ergebnisse gefunden","timed_out":"Zeit\u00fcberschreitung","no_results_found":"Keine Ergebnisse gefunden","no_results_found_source":"Keine Ergebnisse gefunden f\u00fcr Start","no_results_found_target":"Keine Ergebnisse gefunden f\u00fcr Ziel","no_route":"Keine Route hierher m\u00f6glich","route_description":"Routenbeschreibung","get_link_to_route":"Generiere Link","generate_link_to_route":"Warte auf Antwort","link_to_route_timeout":"nicht m\u00f6glich","gpx_file":"GPX Datei","distance":"Distanz","duration":"Dauer","computing_route":"Ihre Route wird berechnet","N":"Norden","E":"Ost","S":"S\u00fcden","W":"Westen","NE":"Nordost","SE":"S\u00fcdost","SW":"S\u00fcdwest","NW":"Nordwest","ordinal_0":"0.","ordinal_1":"1.","ordinal_2":"2.","ordinal_3":"3.","ordinal_4":"4.","ordinal_5":"5.","ordinal_6":"6.","ordinal_7":"7.","ordinal_8":"8.","ordinal_9":"9.","head":"Fahren Sie Richtung %{bearing}","direction_0":"Unbekannte Anweisung","direction_1":"Geradeaus weiterfahren","direction_2":"Leicht rechts abbiegen","direction_3":"Rechts abbiegen","direction_4":"Scharf rechts abbiegen","direction_5":"Wenden","direction_6":"Leicht links abbiegen","direction_7":"Links abbiegen","direction_8":"Scharf links abbiegen","roundabout":"In den Kreisverkehr einfahren und bei %{nth} M\u00f6glichkeit","direction_15":"Sie haben Ihr Ziel erreicht","head_on":"Fahren Sie Richtung %{bearing} auf %{name}","direction_0_on":"Unknown instructiauf %{name}","direction_1_on":"Geradeaus weiterfahren auf %{name}","direction_2_on":"Leicht rechts abbiegen auf %{name}","direction_3_on":"Rechts abbiegen auf %{name}","direction_4_on":"Scharf rechts abbiegen auf %{name}","direction_5_on":"Wenden auf %{name}","direction_6_on":"Leicht links abbiegen auf %{name}","direction_7_on":"Links abbiegen auf %{name}","direction_8_on":"Scharf links abbiegen auf %{name}","roundabout_on":"In den Kreisverkehr einfahren und bei %{nth} M\u00f6glichkeit auf %{name}"},"dk":{"from":"fra","to":"til","title":"I BIKE CPH | Cykelruteplanl\u00e6gger (alpha)","generate_link":"Lav et link","route_description":"Rutebeskrivelse","distance":"afstand","duration":"tid","arrival":"ankomst","1":"f\u00f8rste","2":"anden","3":"tredje","4":"fjerde","5":"femte","6":"sjette","7":"syvende","8":"ottende","9":"niende","10":"tiende","N":"mod nord","NE":"mod nord\u00f8st","E":"mod \u00f8st","SE":"mod syd\u00f8st","S":"mod syd","SW":"mod sydvest","W":"mod vest","NW":"mod nordvest","head":"Start med at k\u00f8re","continue":"K\u00f8r frem","turn-left":"Drej til venstre","turn-slight-left":"Drej let til venstre","turn-sharp-left":"Drej skarpt til venstre","turn-right":"Drej til h\u00f8jre","turn-slight-right":"Drej let til h\u00f8jre","turn-sharp-right":"Drej skarpt til h\u00f8jre","enter-roundabout":"K\u00f8r ind i rundk\u00f8rsel","take-the-nth-exit":"Tag {%nth} afk\u00f8rsel","reached-destination":"Du er fremme ved destinationen","follow":"ad","and_continue":"og forts\u00e6t","for":"og forts\u00e6t","towards":"mod"}};