package models;

import java.time.LocalDate;
import java.time.LocalTime;

public class Compromissos {
	private int id; 
	private LocalDate data;
	private LocalTime hora;
	private String tipo;
	private String contato;
	private String local;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDate getData() {
		return data;
	}
	public void setData(LocalDate data) {
		this.data = data;
	}
	public LocalTime getHora() {
		return hora;
	}
	public void setHora(LocalTime hora) {
		this.hora = hora;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getContato() {
		return contato;
	}
	public void setContato(String contato) {
		this.contato = contato;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	
	public Compromissos(int id, String nome, String email, LocalDate data, LocalTime hora, String tipo, String contato, String local) {
		this.id = id;
		this.data = data;
		this.hora = hora;
		this.tipo = tipo;
		this.contato = contato;
		this.local = local;
	}
	
	public Compromissos() {
	}

}
