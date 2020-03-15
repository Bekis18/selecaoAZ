package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.LeilaoBO;
import br.com.selecao.locadora.entity.Leilao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/leilao/{id}")
public class LeilaoServiceId {

    @Autowired
    private LeilaoBO leilaoBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(leilaoBO.buscarPorId(id));
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public ResponseEntity<?> deletarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(leilaoBO.deletarPorId(id));
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> alterarPorId(@PathVariable Long id, @RequestBody Leilao novoLeilao) {
        return ResponseEntity.ok().body(leilaoBO.alterarLeilaoId(id, novoLeilao));
    }
}