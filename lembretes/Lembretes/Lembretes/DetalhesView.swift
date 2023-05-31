//
//  DetalhesView.swift
//  Lembretes
//
//  Created by Antonio Hoffmann on 23/05/23.
//

import SwiftUI

struct DetalhesView: View {
    @Environment(\.dismiss) var dismiss
    @State private var hasChanges = false
    @State private var showingCancelConfirmation = false
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
        NavigationStack{
            
            List{
                Section{
                    TextField("Label", text: $name)
                        .onChange(of: name) { _ in
                            hasChanges = true
                        }
                    TextField("Notas", text: $notas)
                        .onChange(of: notas) { _ in
                            hasChanges = true
                        }
                    TextField("URL", text: $linki)
                        .onChange(of: linki) { _ in
                            hasChanges = true
                        }
                }
                Section{
                    HStack{
                        
                        ZStack{
                            Rectangle().frame(width:27,height: 27).foregroundColor(.red).cornerRadius(7)
                            Image(systemName: "calendar").resizable().foregroundColor(.white).frame(width:10,height:10)
                        }
                        VStack(spacing:0.01){
                            Toggle("Data", isOn: $isCalendarShown)
                                .onChange(of: isCalendarShown) { _ in
                                    hasChanges = true
                                }
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
                            Image(systemName: "clock.fill").resizable().foregroundColor(.white).frame(width:10,height:10)
                        }
                        VStack(spacing:0.01){
                            Toggle("Horário", isOn: $isClockShown)
                                .onChange(of: isClockShown) { _ in
                                    hasChanges = true
                                }
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
                            Image(systemName: "repeat").resizable().foregroundColor(.white).frame(width:10,height:10)
                            
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
                            Image(systemName: "number").resizable().foregroundColor(.white).frame(width:10,height:10)
                            
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
                                    Image(systemName: "location.fill").resizable().foregroundColor(.white).frame(width:10,height:10)
                                }
                                VStack{
                                    Toggle("Localização", isOn: $isLocationShown)
                                        .onChange(of: isLocationShown) { _ in
                                            hasChanges = true
                                        }
                                    
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
                                Image(systemName: "message.fill").resizable().foregroundColor(.white).frame(width:10,height:10)
                            }
                            VStack{
                                Toggle("Ao Enviar Mensagem", isOn: $isMessageShown)
                                    .onChange(of: isMessageShown) { _ in
                                        hasChanges = true
                                    }
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
                                Image(systemName: "flag.fill").resizable().foregroundColor(.white).frame(width:10,height:10)
                            }
                            VStack{
                                Toggle("Sinalizar", isOn: $isSinalizarShown)
                                    .onChange(of: isSinalizarShown) { _ in
                                        hasChanges = true
                                    }
                                
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
                        .onChange(of: selectedOption) { _ in
                            hasChanges = true
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
                
                
                
                
            }
    }.navigationTitle("Detalhes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        if hasChanges {
                            showingCancelConfirmation = true
                        } else {
                            dismiss()
                        }
                        
                    }, label: {
                        Text("Cancelar")
                    })
                    .confirmationDialog("", isPresented: $showingCancelConfirmation) {
                        Button("Descartar Alterações", role: .destructive, action: dismiss.callAsFunction)
                    }
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

