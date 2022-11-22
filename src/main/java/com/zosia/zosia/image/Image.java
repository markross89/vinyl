package com.zosia.zosia.image;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.zosia.zosia.album.Album;
import lombok.*;

import javax.persistence.*;

@Builder
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@JsonIgnoreProperties(ignoreUnknown = true)
public class Image {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column( nullable = false)
	@JsonIgnore
	private Long id;
	private String resource_url;
	private String width;
	private String type;
	private String uri150;
	private String height;
	@ManyToOne(fetch = FetchType.LAZY)
	private Album album;

}