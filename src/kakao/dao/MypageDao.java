package kakao.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kakao.bean.ProductOrderBean;
import kakao.util.SqlSessionFactoryManager;

public class MypageDao {
private SqlSessionFactory sqlSessionFactory;
	
	public MypageDao(){
		sqlSessionFactory=SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
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
	
}
