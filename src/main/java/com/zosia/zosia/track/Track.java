package com.zosia.zosia.track;

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
public class Track {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false)
	private Long id;
	private String duration;
	private String position;
	private String title;
	@ManyToOne(fetch = FetchType.LAZY)
	private Album album;

}