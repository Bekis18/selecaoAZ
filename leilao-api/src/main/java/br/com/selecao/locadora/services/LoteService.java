package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.LoteBO;
import br.com.selecao.locadora.entity.Lote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/lote")
public class LoteService {

    @Autowired
    private LoteBO loteBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarTodos() {
        return ResponseEntity.ok().body(loteBO.buscarTodos());
    }

    @RequestMapping(method = RequestMethod.POST)
    public ResponseEntity<?> inserirLote(@RequestBody Lote lote) {
        return ResponseEntity.ok().body(loteBO.inserirLote(lote));
    }
}