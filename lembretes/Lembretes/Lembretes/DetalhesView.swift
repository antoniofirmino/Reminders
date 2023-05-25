//
//  DetalhesView.swift
//  Lembretes
//
//  Created by Antonio Hoffmann on 23/05/23.
//

import SwiftUI

struct DetalhesView: View {
    @State private var selectedDate = Date()
    @State private var selectedTime = Date()
    @State private var isCalendarShown = false
    @State private var isClockShown = false
    @State private var isLocationShown = false
    @State private var isMessageShown = false
    @State private var isSinalizarShown = false
    @State private var subtarefas = 0
    
    @State private var name = "Novo lembrete"
    @State var notas = ""
    @State var linki = ""
    @State private var valueToModify = ""
    @State var selectedOption = 0
    var localiz = "Cidade Universitaria Campinas SP 13083-898 Brasil"
    let options = ["Nenhuma","Baixa","Média","Alta"]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d 'de' MMMM 'de' yyyy"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }
    var timeFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }
    
    
    var body: some View {
        NavigationView{
            
            Form{
                Section{
                    TextField("Label", text: $name)
                    TextField("Notas", text: $notas)
                    TextField("URL", text: $linki)
                }
                Section{
                    HStack{
                        
                        ZStack{
                            Rectangle().frame(width:27,height: 27).foregroundColor(.red).cornerRadius(7)
                            Image(systemName: "calendar").foregroundColor(.white)
                        }
                        VStack(spacing:0.01){
                            Toggle("Data", isOn: $isCalendarShown)
                            HStack{
                                Text(dateFormatter.string(from: selectedDate)).foregroundColor(.blue).font(.subheadline)
                                Spacer()
                            }
                        }
                    }
                    
                    
                    if isCalendarShown {
                        CalendarView(selectedDate: $selectedDate)
                    }
                    
                
                
                    HStack{
                        
                        ZStack{
                            Rectangle().frame(width:27,height: 27).foregroundColor(.blue).cornerRadius(7)
                            Image(systemName: "clock.fill").foregroundColor(.white)
                        }
                        VStack(spacing:0.01){
                            Toggle("Horário", isOn: $isClockShown)
                            HStack{
                                Text("\(selectedTime, formatter: timeFormatter)").font(.subheadline).foregroundColor(.blue)
                                Spacer()
                            }
                        }
                    }
                    if isClockShown{
                        withAnimation(.easeInOut(duration: 2)) {
                                        ClockView(selectedTime: $selectedTime)
                                            .transition(.move(edge: .bottom))
                                    }
                        
                    }
                    
                }
                if isCalendarShown || isClockShown{
                    Section{
                    HStack{
                        ZStack{
                            Rectangle().frame(width:27,height: 27).foregroundColor(Color(red:0.255, green:0.255, blue:0.271)).cornerRadius(7)
                            Image(systemName: "repeat").foregroundColor(.white)
                            
                        }
                        NavigationLink(destination: Repetir(valueToModify: $valueToModify)) {
                            HStack{
                                Text("Repetir")
                                Spacer()
                                Text("\(valueToModify)").foregroundColor(.gray)
                            }
                        }
                        
                    }
                }
                }
                Section{
                    HStack{
                        ZStack{
                            Rectangle().frame(width:27,height: 27).foregroundColor(.gray).cornerRadius(7)
                            Image(systemName: "number").foregroundColor(.white)
                            
                        }
                        NavigationLink(destination: EtiquetasView()) {
                            Text("Etiquetas")
                            
                            
                        }
                        
                    }
                    
                }
                Group{
                    Section{
                        VStack{
                            HStack{
                                ZStack{
                                    Rectangle().frame(width:27,height: 27).foregroundColor(.blue).cornerRadius(7)
                                    Image(systemName: "location.fill").foregroundColor(.white)
                                }
                                VStack{
                                    Toggle("Localização", isOn: $isLocationShown)
                                    
                                    
                                }
                            }
                            if isLocationShown{
                                HStack(spacing:24){
                                    VStack{
                                        ZStack{
                                            Circle().frame(width: 60,height:60).foregroundColor(.gray)
                                            Image(systemName: "location.fill").foregroundColor(.white)
                                            
                                        }
                                        Text("Atual").font(.subheadline)
                                    }
                                    VStack{
                                        ZStack{
                                            Circle().frame(width: 60,height:60).foregroundColor(.blue)
                                            Image(systemName: "car.fill").foregroundColor(.white)
                                            
                                        }
                                        Text("Ao Entrar").font(.subheadline)
                                    }
                                    VStack{
                                        ZStack{
                                            Circle().frame(width: 60,height:60).foregroundColor(.blue)
                                            Image(systemName: "car.fill").foregroundColor(.white)
                                            
                                        }
                                        Text("Ao Sair").font(.subheadline)
                                    }
                                    VStack{
                                        ZStack{
                                            Circle().frame(width: 60,height:60).foregroundColor(.gray)
                                            Image(systemName: "ellipsis").foregroundColor(.white)
                                            
                                        }
                                        Text("Personalizada").font(.subheadline).frame(maxWidth: .infinity,maxHeight: .infinity)
                                    }
                                }.frame(maxWidth: .infinity,maxHeight: .infinity)
                                
                            }
                        }
                        if isLocationShown{
                            HStack{
                                Text("Ao chegar em: \(localiz)")
                                Image(systemName: "info.circle").foregroundColor(.blue)
                            }
                        }
                        
                        
                        
                        
                        
                        
                        
                    }
                    Group{
                        
                        Section(footer: Text("Se esta opção for selecionada, a notificação do lembrete será mostrada ao conversar com uma pessoa no app Mensagens.")){
                        HStack{
                            ZStack{
                                Rectangle().frame(width:27,height: 27).foregroundColor(.green).cornerRadius(7)
                                Image(systemName: "message.fill").foregroundColor(.white)
                            }
                            VStack{
                                Toggle("Ao Enviar Mensagem", isOn: $isMessageShown)
                                
                            }
                        }
                        
                    }
                        
                    Section{
                        HStack{
                            ZStack{
                                Rectangle().frame(width:27,height: 27).foregroundColor(.orange).cornerRadius(7)
                                Image(systemName: "flag.fill").foregroundColor(.white)
                            }
                            VStack{
                                Toggle("Sinalizar", isOn: $isSinalizarShown)
                                
                            }
                        }
                        
                    }
                }
                }
                Section{
                    
                        
                        
                        Picker("Prioridade", selection: $selectedOption) {
                                    ForEach(0..<options.count) { index in
                                        Text(options[index])
                                    }
                                }
                        NavigationLink(destination: ListaView()) {
                            HStack{
                                Text("Lista")
                                Spacer()
                                HStack{
                                    Circle().frame(width:10,height:10).foregroundColor(.yellow)
                                    Text("Lembrete").foregroundColor(.gray)
                                }
                                
                            }
                        }
                          
                        
                    

                }
                Section{
                    NavigationLink(destination: SubtarefasView()) {
                        HStack{
                            
                            Text("Subtarefas")
                            Spacer()
                            Text("\(subtarefas)").foregroundColor(.gray)
                        }
                    }

                }
                Section{
                    Button("Adicionar Imagem",action: {
                        notas = "trikas"
                        
                    })
                }
                
                
                
                
            }
    }

    }
}
            
             
                
            
            
        
    



struct DetalhesView_Previews: PreviewProvider {
    static var previews: some View {
        DetalhesView()
    }
}

