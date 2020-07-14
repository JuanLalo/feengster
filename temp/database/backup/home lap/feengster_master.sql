CREATE DEFINER=`dev`@`` PROCEDURE `usp_lab_user_get`(
	IN `master_id` INT

)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY INVOKER
COMMENT 'retorna todo la información de un usuario en cuanto a su relación con su rol, compañía y app.'
BEGIN

  SELECT
    u.id, 
	 u.username, 
	 u.name,
	 u.surnames,
	 u.phone,
	 u.email,
	 u.img,
	 u.password,
	 u.oldpassword,
	 u.birthdate,
	 u.platform,
	 u.updated_at,
	 u.created_at,
	 u.status,
	 a.app_id,
	 cu.id_cat_user,
    c.id_company,
	 c.id 'pk_id_step_2',
	 a.id 'pk_id_step_3',
	 cu.id 'pk_id_step_4' 
    
  FROM users u
    JOIN  user_app a 
	   on u.id = master_id and  u.id = a.user_id and	a.main = 1
	 JOIN
	   user_cat_user cu 
		on	u.id = cu.user_id and cu.main = 1
	 JOIN user_companies c 
	   on u.id = c.user_id
	 
  WHERE
    u.STATUS <> "ELIMINADO"
    order by u.created_at;
                               
END