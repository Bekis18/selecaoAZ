package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.LoteBO;
import br.com.selecao.locadora.entity.Lote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/lote/{id}")
public class LoteServiceId {

    @Autowired
    private LoteBO loteBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(loteBO.buscarPorId(id));
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public ResponseEntity<?> deletarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(loteBO.deletarPorId(id));
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> alterarPorId(@PathVariable Long id, @RequestBody Lote novoLote) {
        return ResponseEntity.ok().body(loteBO.alterarLoteId(id, novoLote));
    }
}