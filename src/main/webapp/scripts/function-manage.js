// JavaScript Document
function DeleteUser(id)
{
	if(confirm("确定要删除吗？")) {
		location.href = "deleteUser.do?euUserId=" + id;
	}
}

function DeleteCategory(id)
{
	if(confirm("确定要删除吗？")) {
		location.href = "deleteCategory.do?epcId=" + id;
	}
}

function DeleteProduct(id)
{
	if(confirm("确定要删除吗？")) {
		location.href = "deleteProduct.do?epId=" + id;
	}
}
function DeleteNews(id)
{
	if(confirm("确定要删除吗？")) {
		location.href = "deleteNews.do?enId=" + id;
	}
}
function DeleteOrder(id)
{
	if(confirm("确定要删除吗？")) {
		location.href = "deleteOrder.do?eoId=" + id;
	}
}