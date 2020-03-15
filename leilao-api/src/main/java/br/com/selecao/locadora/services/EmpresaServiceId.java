package br.com.selecao.locadora.services;

import br.com.selecao.locadora.business.EmpresaBO;
import br.com.selecao.locadora.entity.Empresa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/empresa/{id}")
public class EmpresaServiceId {

    @Autowired
    private EmpresaBO empresaBO;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<?> buscarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(empresaBO.buscarPorId(id));
    }

    @RequestMapping(method = RequestMethod.DELETE)
    public ResponseEntity<?> deletarPorId(@PathVariable Long id) {
        return ResponseEntity.ok().body(empresaBO.deletarPorId(id));
    }

    @RequestMapping(method = RequestMethod.PUT)
    public ResponseEntity<?> alterarPorId(@PathVariable Long id, @RequestBody Empresa novaEmpresa) {
        return ResponseEntity.ok().body(empresaBO.alterarEmpresaId(id, novaEmpresa));
    }
}