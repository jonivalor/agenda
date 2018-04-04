
CREATE OR REPLACE FUNCTION contact_information (
	IN p_mobile_phone             text,
	IN p_land_line                text,
	IN p_email                    text, 
	IN p_address1                 text,
	IN p_address2                 text
) RETURNS contact_information AS 
$$
	SELECT (
		p_mobile_phone,
		p_land_line,
		p_email,
		p_address1,
		p_address2
	)::contact_information;
$$ LANGUAGE sql STABLE STRICT;
