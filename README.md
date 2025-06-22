# Wollok-Bus
A exercice where a Bus go to the diferen stops from a list
class vehicles{ // Establesco la calse de los veiculos

    const property type

    var property amounth_people

    var property amounth_remaining //para almacenar valores anteriores

    var property amounth_people_max

    var property amounth_nafta = 100

    var property start_stop = 0

    var property move = false

    const property stops

    var index = 0

    var gas_stop_index = 0

    method get_down_nafta(){ //si move == True quiere decir que el colectivo esta hjabilitado para moverse y si el veiculo se muve una parada perdera una unidad de nafta
        
        if (move)

            start_stop += 1

            amounth_nafta -= 10

            move = false
    }
   
    method get_people(stop_station){ //su a las personas al colectivo sumanod a los pasajeros

        amounth_people += stop_station.amounth_people_weating()

        if(amounth_people > amounth_people_max){ // si cantidad de persona > maxima de personas

            amounth_remaining = amounth_people - amounth_people_max // cantidad de personas 2 = cantidad de personas - maxima

            amounth_people -= amounth_remaining // canitdad de personas - cantidad 2

            return false // quedan esperando en la parada cantidad de personas restantes
        }
        
        else //en caso de que no sobre gente simplemente se iguala a 0 a las persona de la parada
        
            return true
           
    }

    method max_capacity(){// Si el colectivo esta lleno start_stop (pocicion en la lista) == al final de la lista

        if (amounth_people >= amounth_people_max){

            start_stop == stops.size() -1

            amounth_people = 0 // Se bajan los pasajeros    
            }
        }
    
    method back_in_list() { // Si move == Truse start_stop = start_stop + 1

        if(move){

            start_stop += 1

        }
        
        if (move and start_stop == stops.size() -1) { // Si move == True pero no hay mas a donde ir volvera al inico de la lista

            start_stop == 0

            }
            
        }
      
    method recharge() { // Recargar Nafta si Nafta == 0 entonces recorre la lista medianto la bariable index para buscar la estacion
     
        if (amounth_nafta == 0){
            index = 0
            stops.forEach(
                {stop =>
                    if(stop == "Gas station"){ //Cuando la encuantra el colectivo se mueve hacia ahi y recarga al 100 la nafta
                        gas_stop_index = index
                        start_stop = gas_stop_index
                        amounth_nafta = 100
                    }

                    index += 1

                }
            )
        }

    }




}




//----------------------------------------------------------------------------------------------------------------------

class stop_station{ // Clase de paradas

    const property stop //nombre

    const property position //posicion

    var property amounth_people_weating // cantidad de gente en espera

    method get_empty(){ // dejar basia la parada

        if (vehicles.get_people(amounth_people_weating)){ //si el metodo de get_pople retorna true

            amounth_people_weating = 0

        }

        else

            amounth_people_weating = vehicles.amounth_remaining // si retorna false

    }

}

//----------------------------------------------------------------------------------------------------------------------

const Amenabar = new stop_station(stop = "Amenabar", amounth_people_weating = 9, position = 0)

//-----------------------------------------------------------------------------------------------------------------------

const Nampos_Salles = new stop_station(stop = "Nampos Salles", amounth_people_weating = 9, position = 1)

//-----------------------------------------------------------------------------------------------------------------------

const Gas_station = new stop_station(stop = "Gas station", amounth_people_weating = 9, position = 2)

//-----------------------------------------------------------------------------------------------------------------------

const Maipu = new stop_station(stop = "Maipu", amounth_people_weating = 9, position = 3)

//-----------------------------------------------------------------------------------------------------------------------

const Caseros = new stop_station(stop = "Caseros", amounth_people_weating = 9, position = 4)

//-----------------------------------------------------------------------------------------------------------------------

const Alvarez_Thomas = new stop_station(stop = "Alvarez Thomas", amounth_people_weating = 9, position = 5)

//-----------------------------------------------------------------------------------------------------------------------

const Terminal = new stop_station(stop = "Terminal", amounth_people_weating = 0, position = 6)

//----------------------------------------------------------------------------------------------------------------------
                                                                     
const bus = new vehicles(type = "bus", amounth_people = 0, amounth_remaining = 0, amounth_people_max = 18, stops = [Amenabar, Nampos_Salles, Gas_station, Maipu, Caseros, Alvarez_Thomas, Terminal])
