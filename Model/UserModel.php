<?php
require_once PROJECT_ROOT_PATH . "/Model/Database.php";
 
class UserModel extends Database
{
    public function getAsesor($codigo)
    {
        return $this->select("SELECT * FROM vw_resumen_asesor where codigo_asesor='$codigo'");
        //return $this->select("SELECT * FROM users ORDER BY user_id ASC LIMIT 10");
    }

    public function getCliente($id_asesor)
    {
        return $this->select("SELECT id_cliente,total_pedidos,name_cliente,id_asesor FROM vw_resumen_cliente  where id_asesor=$id_asesor ORDER BY 1");
    }

    public function getPedido($id_cliente,$id_asesor)
    {
        return $this->select("SELECT id_pedido,total_pedido,total_productos,estado,fecha_pago FROM vw_resumen_pedido  where id_cliente=$id_cliente and id_asesor=$id_asesor ORDER BY 1");
    }

    public function getProducto($id_cliente,$id_asesor,$id_pedido)
    {
        return $this->select("SELECT id_producto,tipo,cantidad,valor_unitario,cantidad FROM vw_resumen_producto  where id_cliente=$id_cliente and id_asesor=$id_asesor and id_pedido=$id_pedido ORDER BY 1");
    }
}