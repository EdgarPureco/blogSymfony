<?php

namespace App\Entity;

use App\DTO\AbstractDto;
use App\DTO\UserDto;
use App\Repository\UserRepository;
use DateTimeInterface;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;

#[ORM\Entity(UserRepository::class)]
class User extends AbstractEntity implements UserInterface, PasswordAuthenticatedUserInterface
{
	#[ORM\Column(type: "string", length: 255, nullable: false)]
                                       	private string $name;

	#[ORM\Column(type: "string", length: 255, nullable: false)]
                                       	private string $password;

	#[ORM\Column(type: "string", length: 255, nullable: false)]
                                       	private string $mail;

	#[ORM\Column(type: "string", length: 32, nullable: false)]
										private string $roles;

	#[ORM\Column(type: "string", length: 32, nullable: false)]
	private string $roles;

	#[ORM\Column(type: "datetime", nullable: true)]
                                       	private ?DateTimeInterface $lastLogin = null;

	#[ORM\OneToMany(mappedBy: "user", targetEntity: Order::class, cascade: ["remove"])]
                                       	private Collection $orders;

    #[ORM\OneToMany(mappedBy: 'user', targetEntity: Article::class)]
    private $articles;

    #[ORM\OneToMany(mappedBy: 'user', targetEntity: Comment::class)]
    private $comments;

	public function __construct()
        {
            $this->orders = new ArrayCollection();
            $this->roles = 'ROLE_USER';
            $this->articles = new ArrayCollection();
            $this->comments = new ArrayCollection();
        }

	/**
	 * @param UserDto $dto
	 */
	public function setFromDto(AbstractDto $dto): void {
        $this->setName($dto->name);
        $this->setMail($dto->mail);
        if ($dto->password) {
            $this->setPassword($dto->password);
            }
        }

	public function getName(): string
                                       	{
                                       		return $this->name;
                                       	}

	public function setName(string $name): self
                                       	{
                                       		$this->name = $name;
                                       
                                       		return $this;
                                       	}

	public function getPassword(): ?string
                                       	{
                                       		return $this->password;
                                       	}

	public function setPassword(string $password): self
                                       	{
                                       		$this->password = $password;
                                       
                                       		return $this;
                                       	}


	public function getMail(): string
                                       	{
                                       		return $this->mail;
                                       	}

	public function setMail(string $username): self
                                       	{
                                       		$this->mail = $username;
                                       
                                       		return $this;
                                       	}

	public function getLastLogin(): ?DateTimeInterface
                                       	{
                                       		return $this->lastLogin;
                                       	}

	public function setLastLogin(?DateTimeInterface $lastLogin): self
                                       	{
                                       		$this->lastLogin = $lastLogin;
                                       
                                       		return $this;
                                       	}

	/**
	 * @return Collection|Order[]
	 */
	public function getOrders(): Collection
                                       	{
                                       		return $this->orders;
                                       	}

	public function addOrder(Order $order): self
                                       	{
                                       		if (!$this->orders->contains($order)) {
                                       			$this->orders[] = $order;
                                       			$order->setUser($this);
                                       		}
                                       
                                       		return $this;
                                       	}

	public function removeOrder(Order $order): self
                                       	{
                                       		if ($this->orders->contains($order)) {
                                       			$this->orders->removeElement($order);
                                       			// set the owning side to null (unless already changed)
                                       			if ($order->getUser() === $this) {
                                       				$order->setUser(null);
                                       			}
                                       		}
                                       
                                       		return $this;
                                       	}

	/**
	 * @inheritDoc
	 */
	public function getRoles(): array {
        return explode(',', $this->roles);
        }

	/**
	 * @inheritDoc
	 */
	public function eraseCredentials() {
                                       	}

	public function getUserIdentifier(): string {
                                       		return $this->getMail();
                                       	}

    /**
     * @return Collection<int, Article>
     */
    public function getArticles(): Collection
    {
        return $this->articles;
    }

    public function addArticle(Article $article): self
    {
        if (!$this->articles->contains($article)) {
            $this->articles[] = $article;
            $article->setUser($this);
        }

        return $this;
    }

    public function removeArticle(Article $article): self
    {
        if ($this->articles->removeElement($article)) {
            // set the owning side to null (unless already changed)
            if ($article->getUser() === $this) {
                $article->setUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Comment>
     */
    public function getComments(): Collection
    {
        return $this->comments;
    }

    public function addComment(Comment $comment): self
    {
        if (!$this->comments->contains($comment)) {
            $this->comments[] = $comment;
            $comment->setUser($this);
        }

        return $this;
    }

    public function removeComment(Comment $comment): self
    {
        if ($this->comments->removeElement($comment)) {
            // set the owning side to null (unless already changed)
            if ($comment->getUser() === $this) {
                $comment->setUser(null);
            }
        }

        return $this;
    }
			 
}
