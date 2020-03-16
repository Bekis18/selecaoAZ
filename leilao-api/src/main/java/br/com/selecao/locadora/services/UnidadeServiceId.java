package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.UnidadeBO;
import br.com.selecao.locadora.entity.Unidade;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/unidades/{id}")

public class UnidadeServiceId {

    @Autowired
    private UnidadeBO unidadeBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(unidadeBO.buscarPorId(id));
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public ResponseEntity<?> deletarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(unidadeBO.deletarPorId(id));
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity alterarPorId(@PathVariable Long id, @RequestBody Unidade novaUnidade) {
        return ResponseEntity.ok().body(unidadeBO.alterarUnidadeId(id, novaUnidade));
    }
}