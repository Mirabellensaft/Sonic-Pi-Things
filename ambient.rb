##| functions

define :random_melody do |keynote|
  use_synth :hollow
  with_fx :reverb, mix: 0.7 do
    if keynote == :C3
      3.times do
        play choose([:C2, :Eb2, :G2, :Bb2, :C2, :Eb3, :G3, :Bb3, :C4, :Eb4, :G4, :Bb4])
        sleep 0.2
      end
    elsif keynote == :Eb3
      3.times do
        play choose([:Eb2, :G2, :Bb2, :Eb3, :G3, :Bb3, :Eb4, :G4, :Bb4])
        sleep 0.2
      end
    elsif keynote == :G3
      3.times do
        play choose([:G2, :Bb2, :D2, :G3, :Bb3, :D4, :G4, :Bb4, :D5])
        sleep 0.2
      end
    else
      3.times do
        play choose([:Ab1, :C2, :Eb2, :G2, :Ab2, :C3, :Eb3, :G3, :Ab3, :C4, :Eb4, :G4])
        sleep 0.2
      end
    end
  end
end

##| tick

in_thread do
  loop do
    cue :tick
    sleep 1.6
  end
end

##| drums

in_thread do
  loop do
    sync :tick
    sample :drum_heavy_kick
    sleep 1
    sample :drum_heavy_kick
    sleep 0.3
  end
end

in_thread do
  loop do
    sync :tick
    sleep 0.4
    sample :drum_snare_soft
    sleep 0.8
    sample :drum_snare_soft
  end
end

in_thread do
  loop do
    sync :tick
    7. times do
      sample :perc_snap, amp: 0.2
      sleep 0.2
    end
    sample :perc_snap, amp: 0.2
  end
end

##| harmony

in_thread do
  loop do
    sync :tick
    use_synth :dark_ambience
    note = :C3
    play chord(:C3, :m7), attack: 0.1, attack_level: 1, decay: 0.2, sustain_level: 1, sustain: 1, release: 2
    sleep 2
    note = :Eb3
    play chord(:Eb3, :major), attack: 0.1, attack_level: 1, decay: 0.2, sustain_level: 1, sustain: 1, release: 2
    sleep 2
    note = :G3
    play chord(:G3, :minor), attack: 0.1, attack_level: 1, decay: 0.2, sustain_level: 1, sustain: 1, release: 2
    sleep 2
    note = :Ab3
    play chord(:Ab3, :major7), attack: 0.1, attack_level: 1, decay: 0.2, sustain_level: 1, sustain: 1, release: 2
    sleep 2
  end
end

##| melody

in_thread do
  loop do
    sync :tick
    random_melody :note
  end
end

##| random noises

loop do
  sample :ambi_dark_woosh, amp: 0.2
  sleep 7
end
