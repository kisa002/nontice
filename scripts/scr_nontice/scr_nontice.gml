// HolyKnight (vnycall74@naver.com)
// https://github.com/kisa002

function nontice_get(target, blog_id, log_no)
{
	target.nontice_text = undefined;
	target.nontice_get = http_get("https://blog.naver.com/PostView.nhn?blogId=" + blog_id + "&logNo=" + log_no);
}

function nontice_success(target)
{
	if (ds_map_find_value(async_load, "id") == target.nontice_get)
	{
		if (ds_map_find_value(async_load, "status") == 0)
		{
			text = ds_map_find_value(async_load, "result");
		
			pos = string_pos("|||||", text) + 4;
			text = string_delete(text, 1, pos);
		
			pos = string_pos("|||||", text);
			text = string_delete(text, pos, string_length(text) - pos + 1);
		
			return text;
		}
	}
}