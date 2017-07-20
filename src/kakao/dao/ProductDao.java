package kakao.dao;


import java.io.Closeable;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kakao.bean.ProductBean;
import kakao.util.SqlSessionFactoryManager;

public class ProductDao {
	private SqlSessionFactory sqlSessionFactory;
	
	private void closeSqlSession(Closeable c) {
	      try {
	         if(c != null) c.close();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }

	public ProductDao() {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
	public List<ProductBean> selectAllList(String type){
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSessionFactory.openSession().selectList("selectAllList",type);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			closeSqlSession(sqlSession);
		}
		
	}
	
	public List<ProductBean> selectList(String subtype){
		SqlSession sqlSession = null;
		try {
			sqlSession = sqlSessionFactory.openSession();
			return sqlSessionFactory.openSession().selectList("selectList",subtype);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			closeSqlSession(sqlSession);
		}
		
	}
	
	public Object selectOne(String prono) throws Exception{
		return sqlSessionFactory.openSession().selectOne("selectOne", prono);
	}
}
