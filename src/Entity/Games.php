<?php

namespace App\Entity;

use App\Repository\GamesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: GamesRepository::class)]
class Games
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $title;

    #[ORM\Column(type: 'date')]
    private $year;

    #[ORM\Column(type: 'string', length: 255)]
    private $developer;

    #[ORM\Column(type: 'text')]
    private $synopsis;

    #[ORM\Column(type: 'string', length: 255)]
    private $photo;


    #[ORM\ManyToMany(targetEntity: Plateforme::class, inversedBy: 'games')]
    #[ORM\JoinTable(name:'games_plateformes')]
    private $plateforme;

    #[ORM\ManyToMany(targetEntity: Genre::class, inversedBy: 'games')]
    #[ORM\JoinTable(name:'games_genres')]
    private $genre;

    #[ORM\Column(type: 'text', nullable: true)]
    private $video;

    public function __construct(){
        $this->plateforme = new ArrayCollection();
        $this->genre = new ArrayCollection();

    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitle(): ?string
    {
        return $this->title;
    }

    public function setTitle(string $title): self
    {
        $this->title = $title;

        return $this;
    }

    public function getYear(): ?\DateTimeInterface
    {
        return $this->year;
    }

    public function setYear(\DateTimeInterface $year): self
    {
        $this->year = $year;

        return $this;
    }

    public function getDeveloper(): ?string
    {
        return $this->developer;
    }

    public function setDeveloper(string $developer): self
    {
        $this->developer = $developer;

        return $this;
    }

    public function getSynopsis(): ?string
    {
        return $this->synopsis;
    }

    public function setSynopsis(string $synopsis): self
    {
        $this->synopsis = $synopsis;

        return $this;
    }

    public function getPhoto(): ?string
    {
        return $this->photo;
    }

    public function setPhoto(string $photo): self
    {
        $this->photo = $photo;

        return $this;
    }

    // public function getPlateforme(): ?Plateforme
    // {
    //     return $this->plateforme;
    // }

    // public function setPlateforme(?Plateforme $plateforme): self
    // {
    //     $this->plateforme = $plateforme;

    //     return $this;
    // }

  

    public function getVideo(): ?string
    {
        return $this->video;
    }

    public function setVideo(?string $video): self
    {
        $this->video = $video;

        return $this;
    }

     /**
     * @return Collection
     */
    public function getPlateforme(): ?Collection
    {
        return $this->plateforme;
    }

    /**
     * @param Plateforme $plateforme
     */
    public function setPlateforme(?ArrayCollection $plateforme): self
    {
        $plateforme->addGame($this);

        $this-> plateforme[] = $plateforme;
        return $this;
    }

     /**
     * @return Collection
     */
    public function getGenre(): ?Collection
    {
        return $this->genre;
    }

    /**
     * @param Genre $genre
     */
    public function setGenre(?ArrayCollection $genre): self
    {
        $genre->addGame($this);

        $this-> genre[] = $genre;
        return $this;
    }

}