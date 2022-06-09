<?php
class UserController extends BaseController
{
    /**
     * "/user/list" Endpoint - Get list of users
     */
    public function listAction()
    {
        $strErrorDesc = '';
        $requestMethod = $_SERVER["REQUEST_METHOD"];
        $arrQueryStringParams = $this->getQueryStringParams();
        //print_r($arrQueryStringParams);exit;
        if (strtoupper($requestMethod) == 'GET') {
            try {
                $userModel = new UserModel();
 
                $codigo = '';
                if (isset($arrQueryStringParams) && $arrQueryStringParams) {
                    $codigo = $arrQueryStringParams;
                }

                $result=array();    
                $arrUsers = $userModel->getAsesor($codigo);
                foreach ($arrUsers as $value){
                    $id_asesor=$value['id_asesor'];
                    $result[] = [
                        "codigo_asesor" => $value['codigo_asesor'],
                        "name_asesor" => $value['name_asesor'],
                        "clientes_asignados" => $value['cliente_asignados'],
                        "total_pedidos" => $value['total_pedido'],
                        "clientes" => $this->listClienteAction($id_asesor)
                        //"detalle_pedidos" => $arrPedido            
                    ];

                    //print_r($arrCliente[$i]["id_cliente"]);
                    //print_r($arrPedido);
                    
                }

                $responseData = json_encode($result);
            } catch (Error $e) {
                $strErrorDesc = $e->getMessage().'Something went wrong! Please contact support.';
                $strErrorHeader = 'HTTP/1.1 500 Internal Server Error';
            }
        } else {
            $strErrorDesc = 'Method not supported';
            $strErrorHeader = 'HTTP/1.1 422 Unprocessable Entity';
        }
 
        // send output
        if (!$strErrorDesc) {
            $this->sendOutput(
                $responseData,
                array('Content-Type: application/json', 'HTTP/1.1 200 OK')
            );
        } else {
            $this->sendOutput(json_encode(array('error' => $strErrorDesc)), 
                array('Content-Type: application/json', $strErrorHeader)
            );
        }
    }

    public function listClienteAction($id_asesor){
        $userModel = new UserModel();
        $resultCliente=array();
        $arrCliente= $userModel->getCliente($id_asesor);
        foreach ($arrCliente as $value2){ 
            $resultCliente[] = array(
                "id_cliente"=> $value2['id_cliente'],
                "total_pedidos"=> $value2['total_pedidos'],
                "name_cliente"=> $value2['name_cliente'],
                "detalle_pedidos" => $this->listPedidoAction($value2['id_cliente'],$id_asesor)
            );
        }

        return $resultCliente;
    }  
    
    public function listPedidoAction($id_cliente,$id_asesor){
        $userModel = new UserModel();
        $resultPedido=array();
        $arrPedido= $userModel->getPedido($id_cliente,$id_asesor);
        foreach ($arrPedido as $value3){
            $resultPedido[] = array (
                "id_pedido" => $value3['id_pedido'],
                "total_productos" => $value3['total_productos'],
                "total_pedido" => $value3['total_pedido'],
                "estado" => $value3['estado'],
                "fecha_pago" => $value3['fecha_pago'],
                "productos" => $this->listProductoAction($id_cliente,$id_asesor,$value3['id_pedido'])
            );
        }

        return $resultPedido;
    } 

    public function listProductoAction($id_cliente,$id_asesor,$id_producto){
        $userModel = new UserModel();
        $resultProducto=array();
        $arrProducto= $userModel->getProducto($id_cliente,$id_asesor,$id_producto);
         return $arrProducto;
    } 

}