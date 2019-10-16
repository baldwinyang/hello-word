package entity;

public class Agv {

	private int id;
	private String name;
	private String location;
	private String ip;
	public Agv(int id, String name, String location, String ip) {
		super();
		this.id = id;
		this.name = name;
		this.location = location;
		this.ip = ip;
	}
	public Agv() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "Agv [id=" + id + ", name=" + name + ", location=" + location + ", ip=" + ip + "]";
	}
	
	
}
