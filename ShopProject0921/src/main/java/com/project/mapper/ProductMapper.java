package com.project.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.project.dto.CartDTO;
import com.project.dto.ColorDTO;
import com.project.dto.FileDTO;
import com.project.dto.ProductDTO;
import com.project.dto.SizesDTO;
import com.project.dto.categoryDTO;

@Mapper
public interface ProductMapper {

	List<ProductDTO> selectProductList();

	int deleteProduct(String str);

	void insertProduct(ProductDTO productdto);

	String selectProductNO();

	int insertFileList(FileDTO fileDTO);

	ProductDTO selectProductDTO(String productno);

	List<FileDTO> selectFilePath(String productno);

	String selectFile(Map<String, Object> map);

	List<categoryDTO> selectcategoryList();

	List<ProductDTO> selectProductDetailList(String categoryno);

	List<CartDTO> selectCartProduct(String memberid);


	CartDTO selectCartDTO(CartDTO cdto);

	void deleteCart(HashMap<Object, Object> map);

	ProductDTO ProductDetailView(String productname);

	List<SizesDTO> selectProductSizesList(String productname);

	List<ColorDTO> selectProductColorList(String productname);

	int selectCart(CartDTO cdto);

	int updateQuantity(CartDTO cdto);

	List<ColorDTO> selectColorList();

	List<SizesDTO> selectSizeList();

	int insertCartProduct(CartDTO cdto);

	List<ProductDTO> shopNewProductList(String productno);

	List<SizesDTO> selectproductsizelist(ProductDTO pdto);
	String selectProductNo(CartDTO cdto);
	List<ProductDTO> shopBestProductList(String productno);
}
