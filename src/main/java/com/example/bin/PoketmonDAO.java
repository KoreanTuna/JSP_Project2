package com.example.bin;

import com.example.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PoketmonDAO {
    private Connection conn = null;
    private PreparedStatement stmt = null;
    private ResultSet rs = null;

    private final String poketmon_INSERT = "insert into poketmon (pnumber, pname, type, spcial, pclass, catch_rate,height,weight,familiar, photo, detail) values (?,?,?,?,?,?,?,?,?,?,?)";
    private final String poketmon_UPDATE = "update poketmon set pnumber=?, pname=?, type=?, spcial=?, pclass=?, catch_rate=?,height=?,weight=?,familiar=?, photo=?, detail=? where pid=?";
    private final String poketmon_DELETE = "delete from poketmon where pid =?";
    private final String poketmon_GET = "select * from poketmon where pid=?";
    private final String poketmon_LIST = "select * from poketmon order by pid desc";

    public int insertPoketmon(PoketmonVO vo) {
        System.out.println("===> JDBC로 insertPoketmon() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(poketmon_INSERT);
            stmt.setString(1, vo.getPnumber());
            stmt.setString(2, vo.getPname());
            stmt.setString(3, vo.getType());
            stmt.setString(4, vo.getSpcial());
            stmt.setString(5, vo.getPclass());
            stmt.setInt(6, vo.getCatch_rate());
            stmt.setString(7,vo.getHeight() );
            stmt.setDouble(8,vo.getWeight());
            stmt.setInt(9, vo.getFamiliar());
            stmt.setString(10, vo.getPhoto());
            stmt.setString(11, vo.getDetail());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public PoketmonVO getPoketmon(int pid) {
        PoketmonVO one = new PoketmonVO();
        System.out.println("===> JDBC로 getPoketmon() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(poketmon_GET);
            stmt.setInt(1, pid);
            rs = stmt.executeQuery();

            if(rs.next()) {
                one.setPid(rs.getInt("pid"));
                one.setPnumber(rs.getString("pnumber"));
                one.setPname(rs.getString("pname"));
                one.setType(rs.getString("type"));
                one.setSpcial(rs.getString("spcial"));
                one.setPclass(rs.getString("pclass"));
                one.setCatch_rate(rs.getInt("catch_rate"));
                one.setHeight(rs.getString("height"));
                one.setWeight(rs.getDouble("weight"));
                one.setFamiliar(rs.getInt("familiar"));
                one.setPhoto(rs.getString("photo"));
                one.setDetail(rs.getString("detail"));
            }

            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }
    public void deletePoketmon(PoketmonVO vo) {
        System.out.println("===> JDBC로 deletePoketmon() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(poketmon_DELETE);
            stmt.setInt(1, vo.getPid());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int updatePoketmon(PoketmonVO vo) {
        System.out.println("===> JDBC로 updatePoketmon() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(poketmon_UPDATE);
            stmt.setString(1, vo.getPnumber());
            stmt.setString(2, vo.getPname());
            stmt.setString(3, vo.getType());
            stmt.setString(4, vo.getSpcial());
            stmt.setString(5, vo.getPclass());
            stmt.setInt(6, vo.getCatch_rate());
            stmt.setString(7,vo.getHeight() );
            stmt.setDouble(8,vo.getWeight());
            stmt.setInt(9, vo.getFamiliar());
            stmt.setString(10, vo.getPhoto());
            stmt.setString(11, vo.getDetail());
            stmt.setInt(12, vo.getPid());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<PoketmonVO> getPoketmonList(){
        List<PoketmonVO> list = new ArrayList<PoketmonVO>();
        System.out.println("===> JDBC로 getPoketmonList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(poketmon_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                PoketmonVO one = new PoketmonVO();
                one.setPid(rs.getInt("pid"));
                one.setPnumber(rs.getString("pnumber"));
                one.setPname(rs.getString("pname"));
                one.setType(rs.getString("type"));
                one.setSpcial(rs.getString("spcial"));
                one.setPclass(rs.getString("pclass"));
                one.setCatch_rate(rs.getInt("catch_rate"));
                one.setHeight(rs.getString("height"));
                one.setWeight(rs.getDouble("weight"));
                one.setFamiliar(rs.getInt("familiar"));
                one.setPhoto(rs.getString("photo"));
                one.setDetail(rs.getString("detail"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public String getPhotoFilename(int pid){
        String filename = null;
        try{
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(poketmon_GET);
            stmt.setInt(1, pid);
            rs = stmt.executeQuery();
            if(rs.next()){
                filename = rs.getString("photo");
            }
            rs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("getPhotoFilename() 기능 처리 완료");
        return filename;
    }
}
