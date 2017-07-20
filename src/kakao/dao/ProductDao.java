package kakao.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import kakao.bean.ProductBean;
import kakao.util.SqlSessionFactoryManager;

public class ProductDao {
	private SqlSessionFactory sqlSessionFactory;

	public ProductDao() {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
	public List<ProductBean> selectList()throws Exception{
		return sqlSessionFactory.openSession().selectList("selectList");
	}
	
	public Object selectOne(String prono) throws Exception{
		return sqlSessionFactory.openSession().selectOne("selectOne", prono);
	}
}
