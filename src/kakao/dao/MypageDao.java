package kakao.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kakao.bean.ProductOrderBean;
import kakao.bean.WishBean;
import kakao.util.SqlSessionFactoryManager;

public class MypageDao {
private SqlSessionFactory sqlSessionFactory;
	
	public MypageDao(){
		sqlSessionFactory=SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
	//ÁÖ¹®
	public void orderInsert(ProductOrderBean bean){
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("orderInsert", bean);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
	}
	
	public List<ProductOrderBean> orderSelect(String id) throws Exception{
		return sqlSessionFactory.openSession().selectList("orderSelect", id);
	}
	
	// Âò
	public void wishInsert(WishBean wishBean){
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("wishInsert", wishBean);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
	}
	
	public List<WishBean> wishSelect(String id) throws Exception{
		return sqlSessionFactory.openSession().selectList("wishSelect", id);
	}
	
	public WishBean wishSelectOne(HashMap<String, String> map) throws Exception{
		return sqlSessionFactory.openSession().selectOne("wishSelectOne", map);
	}
	
	public void wishDelete(String idProno){
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("wishDelete", idProno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
	}
	
}
