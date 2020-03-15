package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.CompradorBO;
import br.com.selecao.locadora.entity.Comprador;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/comprador")
public class CompradorService {

    @Autowired
    private CompradorBO compradorBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarTodos() {
        return ResponseEntity.ok().body(compradorBO.buscarTodos());
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> inserirComprador(@RequestBody Comprador comprador) {
        return ResponseEntity.ok().body(compradorBO.inserirComprador(comprador));
    }

}