package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.LeilaoBO;
import br.com.selecao.locadora.entity.Leilao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/leilao")
public class LeilaoService {

    @Autowired
    private LeilaoBO leilaoBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarTodos() {
        return ResponseEntity.ok().body(leilaoBO.buscarTodos());
    }


    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> inserirLeilao(@RequestBody Leilao leilao) {
        return ResponseEntity.ok().body(leilaoBO.inserirLeilao(leilao));
    }
}