//
//  DetalhesView.swift
//  Lembretes
//
//  Created by Antonio Hoffmann on 23/05/23.
//

import SwiftUI

struct DetalhesView: View {
   
    @Environment(\.dismiss) var dismiss
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
    @State private var valueToModify = "Nunca"
    @State private var EndRepeat1 = "Nunca"
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
        NavigationStack{
            
            List{
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
                            Toggle(isOn: $isCalendarShown){
                                VStack{
                                    HStack{
                                        Text("Data")
                                        Spacer()
                                    }
                                    HStack{
                                        Text(dateFormatter.string(from: selectedDate)).foregroundColor(.blue).font(.system(size:12))
                                        Spacer()
                                    }
                                }
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
                            Toggle(isOn: $isClockShown){
                                VStack{
                                    HStack{
                                        Text("Horário")
                                        Spacer()
                                    }
                                    HStack{
                                        Text("\(selectedTime, formatter: timeFormatter)").font(.system(size:12)).foregroundColor(.blue)
                                        Spacer()
                                    }
                                    
                                }
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
//                        if valueToModify != "Nunca"{
//                            NavigationLink(destination: EndRepeat(EndRepeat1: $EndRepeat1)) {
//                                HStack{
//                                    Text("Terminar Repetição")
//                                    Spacer()
//                                    Text("\(EndRepeat1)").foregroundColor(.gray)
//                                }
//                            }
//
//                        }
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
                        VStack(spacing:10){
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
                                VStack{
                                    HStack(spacing:20){
                                        
                                        ZStack{
                                            Circle().frame(width: 60,height:60).foregroundColor(.gray)
                                            Image(systemName: "location.fill").foregroundColor(.white)
                                            
                                        }
                                        
                                        
                                        ZStack{
                                            Circle().frame(width: 60,height:60).foregroundColor(.blue)
                                            Image(systemName: "car.fill").foregroundColor(.white)
                                            
                                        }
                                        
                                        
                                        ZStack{
                                            Circle().frame(width: 60,height:60).foregroundColor(.blue)
                                            Image(systemName: "car.fill").foregroundColor(.white)
                                            
                                        }
                                        
                                        
                                        ZStack{
                                            Circle().frame(width: 60,height:60).foregroundColor(.gray)
                                            Image(systemName: "ellipsis").foregroundColor(.white)
                                            
                                        }
                                        
                                    }
                                    HStack(spacing:24){
                                        ZStack{
                                            Rectangle().foregroundColor(.blue).frame(width:40,height:20).cornerRadius(7)
                                            Text("Atual").font(.system(size:12)).foregroundColor(.white).bold()
                                            
                                        }
                                        Text("Ao Entrar").font(.system(size:12)).offset(x:13)
                                        Text("Ao Sair").font(.system(size:12)).offset(x:22)
                                        Text("Personalizada").font(.system(size:12)).offset(x:15)
                                    }
                                }
                                
                            }
                        }
                        if isLocationShown{
                            HStack{
                                Text("Ao chegar em: \(localiz)").foregroundColor(.gray)
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
                            if isMessageShown{
                                Button("Escolher pessoa", action:{})
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
                    Menu {
                        Button (action: {
                            
                        }) {
                            Label("Tirar Foto", systemImage: "camera")
                        }
                        Button(action: {
                        }){
                            Label("Escanear Documento",systemImage: "doc.viewfinder")
                        }
                        Button(action: {
                            
                        }) {
                            Label("Fototeca", systemImage: "photo.on.rectangle")
                        }
                    } label: {
                        Text("Adicionar Imagem")
                    }
                }
                
                
                
                
            }.listStyle(.insetGrouped)
    }.navigationTitle("Detalhes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()

                    }, label: {
                        Text("Cancelar")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()


                    }, label: {
                        Text("OK")
                    })
                }
            }

    }
}
            
             
                
            
            
        
    



struct DetalhesView_Previews: PreviewProvider {
    static var previews: some View {
        DetalhesView()
    }
}

