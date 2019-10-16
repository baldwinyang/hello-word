package dao;

import java.util.List;

import entity.Agv;


public interface AgvMapper {
	public void save(Agv agv);
	public List<Agv> findAllAgv();
	public void addAgv(Agv agv);
	public void deleteAgvByname(String name);
	public void updateAgv(Agv agv);
	public Agv findByName(String name);
	public void updateAgvLocation(Agv agv);
	
}
