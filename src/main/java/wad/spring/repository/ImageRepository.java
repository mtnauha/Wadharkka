package wad.spring.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import wad.spring.domain.Image;

public interface ImageRepository extends JpaRepository<Image, Long> {
    public Image findById(Long id);
}
