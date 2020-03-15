package br.com.selecao.locadora.business;

import br.com.selecao.locadora.entity.Comprador;
import br.com.selecao.locadora.entity.Lote;
import br.com.selecao.locadora.entity.Unidade;
import br.com.selecao.locadora.repository.LoteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

@Service
public class LoteBO {

    @Autowired
    private LoteRepository loteRepository;

    public List<Lote> buscarTodos(){
        try {
            return loteRepository.findAll();
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Lote buscarPorId(Long id) {
        try {
            return loteRepository.findOne(id);
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return null;
        }
    }

    public Lote inserirLote(Lote lote) {
        try {
            lote.setCreatedAt(LocalDateTime.now());
            lote.setUpdatedAt(LocalDateTime.now());
            return loteRepository.save(lote);
        } catch (Exception e) {
            return null;
        }
    }

    public Lote alterarLoteId(Long id, Lote loteNovo) {
        try {

            Lote loteAtual = buscarPorId(id);

            loteNovo.setCreatedAt(loteAtual.getCreatedAt());
            loteNovo.setUpdatedAt(LocalDateTime.now());

            return loteRepository.save(loteNovo);
        } catch (Exception e) {
            return null;
        }
    }

    public boolean deletarPorId(Long id) {
        try {
            loteRepository.delete(id);
            return true;
        } catch (Exception e) {
            System.out.println(Arrays.toString(e.getStackTrace()));
            return false;
        }
    }
}
