class vehicles { // Establezco la clase de los vehiculos

    const property type

    var property amounth_people

    var property amounth_people_max

    var property amounth_nafta = 100

    var property amounth_nafta_max = 100

    var property start_stop = 0

    var property move = false

    var property amounth_remaining = 0 //para almacenar valores anteriores

    const property stops = route.stops()


   method go_to_terminal() {


        stops.forEach({ stop =>  //llama a todos lo methodos posteriores para crear el ciclo del colectivo
            if (start_stop < stops.size() - 1) {
                move = true
                self.move_in_list()
                self.take_people(stop)
                self.remaining_stops()
                self.nafta_necessary()
                self.down_people(stop)
                    
            }
            else if(start_stop == stops.size() -1){
                self.down_people_terminal()
                self.recharge()
                stops.reverse()
                start_stop = 0
            }
        })
    }

    method remaining_stops() = stops.size() -1 - start_stop  

    method nafta_necessary() = (1 + 0.1 * amounth_people) * self.remaining_stops()

    method down_people_terminal(){

            amounth_people = 0

    }

    method move_in_list(){ //si move == True quiere decir que el colectivo esta habilitado para moverse y si el vehiculo se mueve una parada perdera una unidad de nafta
       
        if (move)

            start_stop += 1

            amounth_nafta -= (1 + (0.1 * amounth_people))

            move = false
            
    }

  method take_people(stop) {

    amounth_people += stop.amounth_people_weating()

    stop.amounth_people_weating(0)
   
    if (amounth_people > amounth_people_max) {

        amounth_remaining = amounth_people - amounth_people_max

        amounth_people -= amounth_remaining

        stop.amounth_people_weating(stop.amounth_people_weating() + amounth_remaining)
       
    } 
    
    else {stop.amounth_people_weating(0)}
    
    }
   
    method can_be_posible_go_terminal() =  self.nafta_necessary() < amounth_nafta // Recargar Nafta si Nafta == 0 entonces recorre la lista medianto la bariable index para buscar la estacion
   
    method recharge(){amounth_nafta = amounth_nafta_max} // Recarga de nafta al llegar a la terminal

    method down_people(stop){//si no es posible ir a la terminal divide a la cantidad de personas y recalcula

    if(not self.can_be_posible_go_terminal()){

        amounth_people -= 1 // Se bajan los pasajeros 

        stop.amounth_people_weating(stop.amounth_people_weating() + 1) //se suma a la cantidad de gente que espera en la parada

        self.down_people(stop) //vuelve a calcular si es posible ir a la terminal

    }
    }
}

//----------------------------------------------------------------------------------------------------------------------

class Bus_stop{ // Clase de paradas

    var property amounth_people_weating // cantidad de gente en espera

}

//----------------------------------------------------------------------------------------------------------------------


class Routes{

    var property stops = []

    method create_stops(amounth) {

        if(amounth > 0 and ){
     
            amounth.times({stop => stops.add(new Bus_stop(amounth_people_weating = 1.randomUpTo(10).round()))})

            self.get_empty_stop()
        }

        else{return null}

    }

    method get_empty_stop() {

        stops.get(0).amounth_people_weating(0)
        stops.get(stops.size() - 1).amounth_people_weating(0)
     
    }

}

//------------------------------------------------------------------------------------------------------------------------

const route = new Routes()

//------------------------------------------------------------------------------------------------------------------------

const bus = new vehicles(type = "bus", amounth_people = 0, amounth_remaining = 0, amounth_people_max = 18)